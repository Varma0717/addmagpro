import 'package:flutter/material.dart';

import 'app_state.dart';
import 'core/config/app_config.dart';
import 'core/network/api_client.dart';
import 'core/storage/secure_storage_service.dart';
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
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFFF7F11),
              primary: const Color(0xFFFF7F11),
              brightness: Brightness.light,
            ),
            scaffoldBackgroundColor: const Color(0xFFF8F9FC),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xFFD6DAE1)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xFFD6DAE1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xFFFF7F11), width: 1.5),
              ),
            ),
          ),
          home: _rootScreen(),
        );
      },
    );
  }

  Widget _rootScreen() {
    if (_appState.booting) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_appState.isAuthenticated) {
      return HomeScreen(appState: _appState);
    }

    return LoginScreen(appState: _appState);
  }
}
