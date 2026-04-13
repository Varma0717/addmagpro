import '../../../core/network/api_client.dart';
import '../models/location_models.dart';

class LocationRepository {
  LocationRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<LocationStateOption>> fetchStates() async {
    final payload = await _apiClient.get('/states');
    final items = _extractList(payload);
    return items
        .map(_stateFromJson)
        .whereType<LocationStateOption>()
        .toList(growable: false);
  }

  Future<List<LocationDistrictOption>> fetchDistricts(int stateId) async {
    final payload = await _apiClient.get('/districts/$stateId');
    final items = _extractList(payload);
    return items
        .map(_districtFromJson)
        .whereType<LocationDistrictOption>()
        .toList(growable: false);
  }

  List<Map<String, dynamic>> _extractList(Map<String, dynamic> payload) {
    final data = payload['data'];
    if (data is List) {
      return data.whereType<Map<String, dynamic>>().toList(growable: false);
    }

    if (data is Map<String, dynamic>) {
      for (final key in ['states', 'districts', 'items']) {
        final nested = data[key];
        if (nested is List) {
          return nested
              .whereType<Map<String, dynamic>>()
              .toList(growable: false);
        }
      }
    }

    return <Map<String, dynamic>>[];
  }

  LocationStateOption? _stateFromJson(Map<String, dynamic> json) {
    final id = _toInt(json['id']);
    final name = (json['name'] ?? json['state_name'] ?? '').toString().trim();
    if (id == null || name.isEmpty) return null;
    return LocationStateOption(id: id, name: name);
  }

  LocationDistrictOption? _districtFromJson(Map<String, dynamic> json) {
    final id = _toInt(json['id']);
    final name =
        (json['name'] ?? json['district_name'] ?? '').toString().trim();
    if (id == null || name.isEmpty) return null;
    return LocationDistrictOption(id: id, name: name);
  }

  int? _toInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }
}
