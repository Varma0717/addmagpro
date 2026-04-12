class AuthUser {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String? referralCode;
  final String? avatarUrl;
  final String? role;
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
    this.isActive = true,
    this.walletBalance = 0,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: (json['id'] as num).toInt(),
      name: (json['name'] as String?) ?? 'User',
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      referralCode: json['referral_code'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      role: json['role'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      walletBalance: (json['wallet_balance'] as num?)?.toDouble() ?? 0,
    );
  }
}
