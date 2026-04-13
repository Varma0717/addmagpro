import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_state.dart';
import 'core/config/app_config.dart';
import 'core/network/api_client.dart';
import 'core/storage/secure_storage_service.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/auth_repository.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/home/home_screen.dart';

class AddMagProApp extends StatefulWidget {
  const AddMagProApp({super.key});

  @override
  State<AddMagProApp> createState() => _AddMagProAppState();
}

class _AddMagProAppState extends State<AddMagProApp> {
  late final AppState _appState;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    final authRepository = AuthRepository(
      apiClient: ApiClient(),
      storage: SecureStorageService(),
    );

    _appState = AppState(authRepository);
    _appState.initialize();
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
