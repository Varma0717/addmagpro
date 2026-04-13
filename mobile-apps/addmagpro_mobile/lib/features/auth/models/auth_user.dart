class AuthUser {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String? referralCode;
  final String? avatarUrl;
  final String? role;
  final String? city;
  final String? state;
  final bool isActive;
  final double walletBalance;

  const AuthUser({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.referralCode,
    this.avatarUrl,
    this.role,
    this.city,
    this.state,
    this.isActive = true,
    this.walletBalance = 0,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: _toInt(json['id']) ?? 0,
      name: (json['name'] as String?) ?? 'User',
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      referralCode: json['referral_code'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      role: json['role'] as String?,
      city: _firstString(json, ['city', 'location_city']),
      state: _firstString(json, ['state', 'location_state']),
      isActive: _toBool(json['is_active']) ?? true,
      walletBalance: _toDouble(json['wallet_balance']) ?? 0,
    );
  }

  AuthUser copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? referralCode,
    String? avatarUrl,
    String? role,
    String? city,
    String? state,
    bool? isActive,
    double? walletBalance,
  }) {
    return AuthUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      referralCode: referralCode ?? this.referralCode,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      role: role ?? this.role,
      city: city ?? this.city,
      state: state ?? this.state,
      isActive: isActive ?? this.isActive,
      walletBalance: walletBalance ?? this.walletBalance,
    );
  }

  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  static bool? _toBool(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is num) return value != 0;
    if (value is String) {
      final normalized = value.trim().toLowerCase();
      if (normalized == 'true' || normalized == '1') return true;
      if (normalized == 'false' || normalized == '0') return false;
    }
    return null;
  }

  static String? _firstString(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value is String && value.trim().isNotEmpty) {
        return value.trim();
      }
    }
    return null;
  }
}
