import '../../../core/network/api_client.dart';
import '../models/home_feed_models.dart';

class HomeRepository {
  HomeRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<HomeFeed> fetch({
    double? latitude,
    double? longitude,
    String? city,
    int? stateId,
    int? districtId,
  }) async {
    final params = <String>[];
    if (latitude != null && longitude != null) {
      params
        ..add('lat=$latitude')
        ..add('lng=$longitude');
    }
    if (city != null && city.trim().isNotEmpty) {
      params.add('city=${Uri.encodeComponent(city.trim())}');
    }
    if (stateId != null) {
      params.add('state_id=$stateId');
    }
    if (districtId != null) {
      params.add('district_id=$districtId');
    }

    final path = params.isEmpty ? '/home' : '/home?${params.join('&')}';
    final payload = await _apiClient.get(path);
    return HomeFeed.fromJson(payload);
  }

  Future<List<LocationStateOption>> fetchStates() async {
    final payload = await _apiClient.get('/states');
    final items = (payload['data'] as List<dynamic>? ?? <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .map(LocationStateOption.fromJson)
        .toList();
    return items;
  }

  Future<List<LocationDistrictOption>> fetchDistricts(int stateId) async {
    final payload = await _apiClient.get('/districts/$stateId');
    final items = (payload['data'] as List<dynamic>? ?? <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .map(LocationDistrictOption.fromJson)
        .toList();
    return items;
  }
}

class LocationStateOption {
  const LocationStateOption({required this.id, required this.name});

  final int id;
  final String name;

  factory LocationStateOption.fromJson(Map<String, dynamic> json) {
    return LocationStateOption(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['state_name'] as String?) ?? 'Unknown',
    );
  }
}

class LocationDistrictOption {
  const LocationDistrictOption({required this.id, required this.name});

  final int id;
  final String name;

  factory LocationDistrictOption.fromJson(Map<String, dynamic> json) {
    return LocationDistrictOption(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['district_name'] as String?) ?? 'Unknown',
    );
  }
}
