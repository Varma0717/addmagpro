import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _tokenKey = 'auth_token';
  static const _locationStateIdKey = 'location_state_id';
  static const _locationStateNameKey = 'location_state_name';
  static const _locationDistrictIdKey = 'location_district_id';
  static const _locationDistrictNameKey = 'location_district_name';

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

  Future<void> writeLocation({
    required int stateId,
    required String stateName,
    int? districtId,
    String? districtName,
  }) async {
    await _storage.write(key: _locationStateIdKey, value: stateId.toString());
    await _storage.write(key: _locationStateNameKey, value: stateName);
    await _storage.write(
      key: _locationDistrictIdKey,
      value: districtId?.toString(),
    );
    await _storage.write(key: _locationDistrictNameKey, value: districtName);
  }

  Future<({int? stateId, String? stateName, int? districtId, String? districtName})>
      readLocation() async {
    final stateIdRaw = await _storage.read(key: _locationStateIdKey);
    final districtIdRaw = await _storage.read(key: _locationDistrictIdKey);

    return (
      stateId: int.tryParse(stateIdRaw ?? ''),
      stateName: await _storage.read(key: _locationStateNameKey),
      districtId: int.tryParse(districtIdRaw ?? ''),
      districtName: await _storage.read(key: _locationDistrictNameKey),
    );
  }

  Future<void> clearLocation() async {
    await _storage.delete(key: _locationStateIdKey);
    await _storage.delete(key: _locationStateNameKey);
    await _storage.delete(key: _locationDistrictIdKey);
    await _storage.delete(key: _locationDistrictNameKey);
  }
}
