import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';

class LocationOption {
  const LocationOption({required this.id, required this.name});

  final int id;
  final String name;

  factory LocationOption.fromStateJson(Map<String, dynamic> json) {
    return LocationOption(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['state_name'] as String?)?.trim().isNotEmpty == true
          ? (json['state_name'] as String)
          : 'Unknown State',
    );
  }

  factory LocationOption.fromDistrictJson(Map<String, dynamic> json) {
    return LocationOption(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['district_name'] as String?)?.trim().isNotEmpty == true
          ? (json['district_name'] as String)
          : 'Unknown District',
    );
  }
}

class LocationSelection {
  const LocationSelection({
    this.stateId,
    this.stateName,
    this.districtId,
    this.districtName,
    required this.label,
  });

  final int? stateId;
  final String? stateName;
  final int? districtId;
  final String? districtName;
  final String label;

  factory LocationSelection.fromJson(Map<String, dynamic> json) {
    return LocationSelection(
      stateId: (json['state_id'] as num?)?.toInt(),
      stateName: json['state_name'] as String?,
      districtId: (json['district_id'] as num?)?.toInt(),
      districtName: json['district_name'] as String?,
      label: ((json['label'] as String?)?.trim().isNotEmpty ?? false)
          ? (json['label'] as String)
          : 'All India',
    );
  }
}

class LocationRepository {
  LocationRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<LocationOption>> fetchStates() async {
    final payload = await _apiClient.get('/states');
    final data = payload['data'];
    if (data is! List) {
      throw ApiException('Invalid states response');
    }

    return data
        .whereType<Map<String, dynamic>>()
        .map(LocationOption.fromStateJson)
        .where((s) => s.id > 0)
        .toList();
  }

  Future<List<LocationOption>> fetchDistricts(int stateId) async {
    final payload = await _apiClient.get('/districts/$stateId');
    final data = payload['data'];
    if (data is! List) {
      throw ApiException('Invalid districts response');
    }

    return data
        .whereType<Map<String, dynamic>>()
        .map(LocationOption.fromDistrictJson)
        .where((d) => d.id > 0)
        .toList();
  }

  Future<LocationSelection> fetchSelection(String token) async {
    final payload = await _apiClient.get('/account/location', bearerToken: token);
    final data = payload['data'];
    if (data is! Map<String, dynamic>) {
      throw ApiException('Invalid location response');
    }
    return LocationSelection.fromJson(data);
  }

  Future<LocationSelection> updateSelection(
    String token, {
    int? stateId,
    int? districtId,
  }) async {
    final payload = await _apiClient.post(
      '/account/location',
      bearerToken: token,
      body: <String, dynamic>{
        'state_id': stateId,
        'district_id': districtId,
      },
    );
    final data = payload['data'];
    if (data is! Map<String, dynamic>) {
      throw ApiException('Invalid location response');
    }
    return LocationSelection.fromJson(data);
  }
}
