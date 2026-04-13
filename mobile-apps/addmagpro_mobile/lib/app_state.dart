import 'package:flutter/material.dart';

import 'core/storage/secure_storage_service.dart';
import 'features/auth/data/auth_repository.dart';
import 'features/auth/models/auth_user.dart';
import 'features/location/data/location_repository.dart';
import 'features/location/models/location_models.dart';

class AppState extends ChangeNotifier {
  AppState(this._authRepository, this._locationRepository, this._storage);

  final AuthRepository _authRepository;
  final LocationRepository _locationRepository;
  final SecureStorageService _storage;

  bool _booting = true;
  bool _busy = false;
  String? _token;
  AuthUser? _currentUser;
  List<LocationStateOption> _locationStates = <LocationStateOption>[];
  List<LocationDistrictOption> _locationDistricts = <LocationDistrictOption>[];
  LocationStateOption? _selectedState;
  LocationDistrictOption? _selectedDistrict;
  bool _loadingLocations = false;

  bool get booting => _booting;
  bool get busy => _busy;
  bool get isAuthenticated => _token != null && _currentUser != null;
  String? get token => _token;
  AuthUser? get currentUser => _currentUser;
  List<LocationStateOption> get locationStates => _locationStates;
  List<LocationDistrictOption> get locationDistricts => _locationDistricts;
  LocationStateOption? get selectedState => _selectedState;
  LocationDistrictOption? get selectedDistrict => _selectedDistrict;
  bool get loadingLocations => _loadingLocations;

  Future<void> initialize() async {
    _booting = true;
    notifyListeners();

    final token = await _authRepository.readToken();
    await _restoreLocation();
    await _loadLocationStates();

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

  Future<void> _restoreLocation() async {
    final saved = await _storage.readLocation();
    if (saved.stateId == null || (saved.stateName ?? '').trim().isEmpty) {
      return;
    }

    _selectedState = LocationStateOption(
      id: saved.stateId!,
      name: saved.stateName!.trim(),
    );

    if (saved.districtId != null && (saved.districtName ?? '').trim().isNotEmpty) {
      _selectedDistrict = LocationDistrictOption(
        id: saved.districtId!,
        name: saved.districtName!.trim(),
      );
    }
  }

  Future<void> _loadLocationStates() async {
    _loadingLocations = true;
    notifyListeners();

    try {
      _locationStates = await _locationRepository.fetchStates();

      if (_selectedState != null) {
        final matchedState = _locationStates
            .where((item) => item.id == _selectedState!.id)
            .firstOrNull;
        if (matchedState != null) {
          _selectedState = matchedState;
          await _loadDistrictsForState(matchedState.id, notify: false);
        } else {
          _selectedState = null;
          _selectedDistrict = null;
          _locationDistricts = <LocationDistrictOption>[];
          await _storage.clearLocation();
        }
      }
    } catch (_) {
      _locationStates = <LocationStateOption>[];
      _locationDistricts = <LocationDistrictOption>[];
    } finally {
      _loadingLocations = false;
      notifyListeners();
    }
  }

  Future<void> _loadDistrictsForState(
    int stateId, {
    bool notify = true,
  }) async {
    final districts = await _locationRepository.fetchDistricts(stateId);
    _locationDistricts = districts;

    if (_selectedDistrict != null) {
      final matchedDistrict = _locationDistricts
          .where((item) => item.id == _selectedDistrict!.id)
          .firstOrNull;
      _selectedDistrict = matchedDistrict;
    }

    if (notify) {
      notifyListeners();
    }
  }

  Future<void> selectState(LocationStateOption? state) async {
    if (state == null) {
      _selectedState = null;
      _selectedDistrict = null;
      _locationDistricts = <LocationDistrictOption>[];
      await _storage.clearLocation();
      notifyListeners();
      return;
    }

    _selectedState = state;
    _selectedDistrict = null;
    _locationDistricts = <LocationDistrictOption>[];
    notifyListeners();

    await _storage.writeLocation(stateId: state.id, stateName: state.name);
    await _loadDistrictsForState(state.id);
  }

  Future<void> selectDistrict(LocationDistrictOption? district) async {
    _selectedDistrict = district;

    final selectedState = _selectedState;
    if (selectedState == null) {
      await _storage.clearLocation();
      notifyListeners();
      return;
    }

    await _storage.writeLocation(
      stateId: selectedState.id,
      stateName: selectedState.name,
      districtId: district?.id,
      districtName: district?.name,
    );
    notifyListeners();
  }

  Future<void> refreshProfile() async {
    if (_token == null) {
      return;
    }

    final me = await _authRepository.me(_token!);
    _currentUser = me;
    notifyListeners();
  }

  void replaceCurrentUser(AuthUser user) {
    _currentUser = user;
    notifyListeners();
  }
}

extension<T> on Iterable<T> {
  T? get firstOrNull {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return null;
    return iterator.current;
  }
}
