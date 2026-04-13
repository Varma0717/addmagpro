import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../network/api_client.dart';
import 'notification_sync_bus.dart';

typedef AuthTokenProvider = String? Function();
typedef NotificationRouteHandler = void Function(Map<String, dynamic> data);

class PushNotificationService {
  PushNotificationService({required ApiClient apiClient}) : _apiClient = apiClient;

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'addmagpro_high_importance',
    'AddMagPro Notifications',
    description: 'Order, reward and offer updates',
    importance: Importance.max,
  );

  final ApiClient _apiClient;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  Future<void> initialize({
    required AuthTokenProvider authTokenProvider,
    required NotificationRouteHandler onRouteRequested,
  }) async {
    if (_isInitialized) return;

    await _requestPermissions();
    await _initLocalNotifications(onRouteRequested);

    FirebaseMessaging.onMessage.listen((message) async {
      NotificationSyncBus.emit(message.data);
      await _showForegroundNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      NotificationSyncBus.emit(message.data);
      onRouteRequested(message.data);
    });

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      NotificationSyncBus.emit(initialMessage.data);
      onRouteRequested(initialMessage.data);
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
    } catch (_) {
      // Best-effort registration; ignore if backend is temporarily unavailable.
    }
  }

  Future<void> unregisterToken({required String authToken}) async {
    if (authToken.isEmpty) return;

    final fcmToken = await _messaging.getToken();
    if (fcmToken == null || fcmToken.isEmpty) return;

    try {
      await _apiClient.delete(
        '/account/device-tokens',
        bearerToken: authToken,
        body: {'token': fcmToken},
      );
    } catch (_) {
      // Best-effort cleanup to avoid blocking logout.
    }
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

  Future<void> _initLocalNotifications(NotificationRouteHandler onRouteRequested) async {
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
          NotificationSyncBus.emit(decoded);
          onRouteRequested(decoded);
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
