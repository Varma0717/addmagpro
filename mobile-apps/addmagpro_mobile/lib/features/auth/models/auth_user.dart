class AuthUser {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String? referralCode;

  const AuthUser({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.referralCode,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: json['id'] as int,
      name: (json['name'] as String?) ?? 'User',
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      referralCode: json['referral_code'] as String?,
    );
  }
}
