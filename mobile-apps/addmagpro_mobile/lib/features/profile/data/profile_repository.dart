import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import '../../auth/models/auth_user.dart';

class ProfileRepository {
  ProfileRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<AuthUser> updateProfile(
    String token, {
    required String name,
    String? phone,
    String? email,
    String? avatarPath,
  }) async {
    late final Map<String, dynamic> payload;

    if (avatarPath != null && avatarPath.isNotEmpty) {
      payload = await _apiClient.multipartPost(
        '/account/profile',
        bearerToken: token,
        fields: <String, String>{
          'name': name,
          if (phone != null && phone.trim().isNotEmpty) 'phone': phone.trim(),
          if (email != null && email.trim().isNotEmpty) 'email': email.trim(),
        },
        filePaths: <String, String>{'avatar': avatarPath},
      );
    } else {
      payload = await _apiClient.post(
        '/account/profile',
        bearerToken: token,
        body: <String, dynamic>{
          'name': name,
          'phone': (phone ?? '').trim().isEmpty ? null : phone,
          'email': (email ?? '').trim().isEmpty ? null : email,
        },
      );
    }

    final data = payload['data'];
    if (data is! Map<String, dynamic>) {
      throw ApiException('Invalid profile response');
    }

    return AuthUser.fromJson(data);
  }
}