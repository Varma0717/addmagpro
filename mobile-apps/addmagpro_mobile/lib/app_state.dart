import 'package:flutter/material.dart';

import 'features/auth/data/auth_repository.dart';
import 'features/auth/models/auth_user.dart';

class AppState extends ChangeNotifier {
  AppState(this._authRepository);

  final AuthRepository _authRepository;

  bool _booting = true;
  bool _busy = false;
  String? _token;
  AuthUser? _currentUser;

  bool get booting => _booting;
  bool get busy => _busy;
  bool get isAuthenticated => _token != null && _currentUser != null;
  AuthUser? get currentUser => _currentUser;

  Future<void> initialize() async {
    _booting = true;
    notifyListeners();

    final token = await _authRepository.readToken();
    if (token == null || token.isEmpty) {
      _booting = false;
      notifyListeners();
      return;
    }

    try {
      final me = await _authRepository.me(token);
      _token = token;
      _currentUser = me;
    } catch (_) {
      await _authRepository.clearToken();
      _token = null;
      _currentUser = null;
    } finally {
      _booting = false;
      notifyListeners();
    }
  }

  Future<void> login({required String phone, required String password}) async {
    _busy = true;
    notifyListeners();

    try {
      final (user, token) = await _authRepository.login(
        phone: phone,
        password: password,
      );
      await _authRepository.persistToken(token);
      _token = token;
      _currentUser = user;
    } finally {
      _busy = false;
      notifyListeners();
    }
  }

  Future<void> register({
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
    String? email,
    String? referralCode,
  }) async {
    _busy = true;
    notifyListeners();

    try {
      final (user, token) = await _authRepository.register(
        name: name,
        phone: phone,
        password: password,
        passwordConfirmation: passwordConfirmation,
        email: email,
        referralCode: referralCode,
      );
      await _authRepository.persistToken(token);
      _token = token;
      _currentUser = user;
    } finally {
      _busy = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    if (_token != null) {
      await _authRepository.logout(_token!);
    } else {
      await _authRepository.clearToken();
    }

    _token = null;
    _currentUser = null;
    notifyListeners();
  }
}
