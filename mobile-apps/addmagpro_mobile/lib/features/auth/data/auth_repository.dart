import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/storage/secure_storage_service.dart';
import '../models/auth_user.dart';

class AuthRepository {
  AuthRepository({
    required ApiClient apiClient,
    required SecureStorageService storage,
  })  : _apiClient = apiClient,
        _storage = storage;

  final ApiClient _apiClient;
  final SecureStorageService _storage;

  Future<(AuthUser, String)> login({
    required String phone,
    required String password,
  }) async {
    final payload = await _apiClient.post(
      '/auth/login',
      body: <String, dynamic>{
        'phone': phone,
        'password': password,
        'device_name': 'flutter-mobile',
      },
    );

    return _extractAuth(payload);
  }

  Future<(AuthUser, String)> register({
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
    String? email,
    String? referralCode,
  }) async {
    final payload = await _apiClient.post(
      '/auth/register',
      body: <String, dynamic>{
        'name': name,
        'phone': phone,
        'email': (email ?? '').trim().isEmpty ? null : email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'referral_code': (referralCode ?? '').trim().isEmpty
            ? null
            : referralCode?.trim().toUpperCase(),
      },
    );

    return _extractAuth(payload);
  }

  Future<void> persistToken(String token) => _storage.writeToken(token);

  Future<String?> readToken() => _storage.readToken();

  Future<void> clearToken() => _storage.clearToken();

  Future<AuthUser> me(String token) async {
    final payload = await _apiClient.get('/me', bearerToken: token);
    final data = payload['data'];

    if (data is! Map<String, dynamic>) {
      throw ApiException('Invalid profile response');
    }

    return AuthUser.fromJson(data);
  }

  Future<void> logout(String token) async {
    try {
      await _apiClient.post('/auth/logout', bearerToken: token);
    } catch (_) {
      // Ignore remote logout failures and still clear local token.
    }
    await clearToken();
  }

  (AuthUser, String) _extractAuth(Map<String, dynamic> payload) {
    final data = payload['data'];
    if (data is! Map<String, dynamic>) {
      throw ApiException('Invalid authentication response');
    }

    final token = data['token'] as String?;
    final userJson = data['user'];

    if (token == null || userJson is! Map<String, dynamic>) {
      throw ApiException('Missing token or user data');
    }

    return (AuthUser.fromJson(userJson), token);
  }
}
