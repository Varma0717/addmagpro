import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_state.dart';
import 'core/config/app_config.dart';
import 'core/network/api_client.dart';
import 'core/notifications/push_notification_service.dart';
import 'core/storage/secure_storage_service.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/auth_repository.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/home/home_screen.dart';
import 'features/notifications/presentation/notifications_screen.dart';
import 'features/orders/presentation/orders_screen.dart';

class AddMagProApp extends StatefulWidget {
  const AddMagProApp({super.key});

  @override
  State<AddMagProApp> createState() => _AddMagProAppState();
}

class _AddMagProAppState extends State<AddMagProApp> {
  late final AppState _appState;
  late final PushNotificationService _pushNotificationService;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  String? _lastAuthToken;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    final apiClient = ApiClient();
    final authRepository = AuthRepository(
      apiClient: apiClient,
      storage: SecureStorageService(),
    );

    _appState = AppState(authRepository);
    _pushNotificationService = PushNotificationService(apiClient: apiClient);

    _appState.addListener(_onAppStateChanged);
    _appState.initialize();

    _pushNotificationService.initialize(
      authTokenProvider: () => _appState.token,
      onRouteRequested: _handleNotificationRoute,
    );
  }

  @override
  void dispose() {
    _appState.removeListener(_onAppStateChanged);
    super.dispose();
  }

  void _onAppStateChanged() {
    final token = _appState.token;
    if (token == null || token.isEmpty) {
      _lastAuthToken = null;
      return;
    }

    if (token == _lastAuthToken) {
      return;
    }

    _lastAuthToken = token;
    _pushNotificationService.registerOrUpdateToken(authTokenProvider: () => _appState.token);
  }

  void _handleNotificationRoute(Map<String, dynamic> data) {
    final token = _appState.token;
    if (token == null || token.isEmpty) return;

    final type = (data['type'] ?? '').toString().toLowerCase();
    final event = (data['event'] ?? '').toString().toLowerCase();

    final navigator = _navigatorKey.currentState;
    if (navigator == null) return;

    if (type == 'order' || event.startsWith('order_')) {
      navigator.push(MaterialPageRoute<void>(builder: (_) => OrdersScreen(token: token)));
      return;
    }

    navigator.push(MaterialPageRoute<void>(builder: (_) => NotificationsScreen(token: token)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _appState,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConfig.appName,
          theme: AppTheme.light,
          navigatorKey: _navigatorKey,
          home: _rootScreen(),
        );
      },
    );
  }

  Widget _rootScreen() {
    if (_appState.booting) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.storefront_rounded, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 20),
              const Text(
                'AddMagPro',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 24),
              const SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(strokeWidth: 2.5, color: AppColors.primary),
              ),
            ],
          ),
        ),
      );
    }

    if (_appState.isAuthenticated) {
      return HomeScreen(appState: _appState);
    }

    return LoginScreen(appState: _appState);
  }
}
