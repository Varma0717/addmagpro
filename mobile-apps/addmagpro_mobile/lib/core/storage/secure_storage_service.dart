import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _tokenKey = 'auth_token';
  static const _fcmTokenKey = 'fcm_token';

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> writeToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> readToken() async {
    return _storage.read(key: _tokenKey);
  }

  Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<void> writeFcmToken(String token) async {
    await _storage.write(key: _fcmTokenKey, value: token);
  }

  Future<String?> readFcmToken() async {
    return _storage.read(key: _fcmTokenKey);
  }

  Future<void> clearFcmToken() async {
    await _storage.delete(key: _fcmTokenKey);
  }
}

