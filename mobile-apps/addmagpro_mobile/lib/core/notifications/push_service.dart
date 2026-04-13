import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../network/api_client.dart';
import '../storage/secure_storage_service.dart';

typedef AuthTokenProvider = String? Function();
typedef PushRouteHandler = void Function(NotificationDestination destination, Map<String, dynamic> data);

enum NotificationDestination { orders, wallet, referrals, notifications }

class PushService {
  PushService({
    required ApiClient apiClient,
    SecureStorageService? storage,
  })  : _apiClient = apiClient,
        _storage = storage ?? SecureStorageService();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'addmagpro_high_importance',
    'AddMagPro Notifications',
    description: 'Order, reward and offer updates',
    importance: Importance.max,
  );

  final ApiClient _apiClient;
  final SecureStorageService _storage;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  Future<void> initialize({
    required AuthTokenProvider authTokenProvider,
    required PushRouteHandler onRouteRequested,
  }) async {
    if (_isInitialized) return;

    await _requestPermissions();
    await _initLocalNotifications(onRouteRequested);

    FirebaseMessaging.onMessage.listen((message) async {
      await _showForegroundNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      onRouteRequested(_destinationForPayload(message.data), message.data);
    });

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      onRouteRequested(_destinationForPayload(initialMessage.data), initialMessage.data);
    }

    _messaging.onTokenRefresh.listen((token) async {
      await registerOrUpdateToken(token: token, authTokenProvider: authTokenProvider);
    });

    _isInitialized = true;

    final token = await _messaging.getToken();
    await registerOrUpdateToken(token: token, authTokenProvider: authTokenProvider);
  }

  Future<void> registerOrUpdateToken({
    String? token,
    required AuthTokenProvider authTokenProvider,
  }) async {
    final authToken = authTokenProvider();
    if (authToken == null || authToken.isEmpty) return;

    final fcmToken = token ?? await _messaging.getToken();
    if (fcmToken == null || fcmToken.isEmpty) return;

    final previousToken = await _storage.readFcmToken();
    if (previousToken == fcmToken) return;

    try {
      await _apiClient.post(
        '/account/device-tokens',
        bearerToken: authToken,
        body: {
          'token': fcmToken,
          'platform': _platformName,
          'device_name': 'addmagpro-mobile',
        },
      );
      await _storage.writeFcmToken(fcmToken);
    } catch (_) {
      // Best-effort registration; ignore if backend is temporarily unavailable.
    }
  }

  NotificationDestination _destinationForPayload(Map<String, dynamic> data) {
    final type = (data['type'] ?? '').toString().toLowerCase();
    final event = (data['event'] ?? '').toString().toLowerCase();
    final screen = (data['screen'] ?? data['target'] ?? '').toString().toLowerCase();

    if (type == 'order' || event.startsWith('order_') || screen == 'orders') {
      return NotificationDestination.orders;
    }

    if (type == 'wallet' || event.startsWith('wallet_') || screen == 'wallet') {
      return NotificationDestination.wallet;
    }

    if (type == 'referral' || type == 'referrals' || event.startsWith('referral_') || screen == 'referrals') {
      return NotificationDestination.referrals;
    }

    return NotificationDestination.notifications;
  }

  Future<void> _requestPermissions() async {
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      announcement: true,
      carPlay: false,
      criticalAlert: false,
    );
  }

  Future<void> _initLocalNotifications(PushRouteHandler onRouteRequested) async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _localNotifications.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
      onDidReceiveNotificationResponse: (response) {
        final payload = response.payload;
        if (payload == null || payload.isEmpty) return;
        final decoded = jsonDecode(payload);
        if (decoded is Map<String, dynamic>) {
          onRouteRequested(_destinationForPayload(decoded), decoded);
        }
      },
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
  }

  Future<void> _showForegroundNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    await _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      payload: jsonEncode(message.data),
    );
  }

  String get _platformName {
    if (kIsWeb) return 'web';
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return 'android';
      case TargetPlatform.iOS:
        return 'ios';
      default:
        return 'android';
    }
  }
}
