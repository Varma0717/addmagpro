class ReferralResponse {
  const ReferralResponse({
    required this.referralCode,
    required this.totalReferrals,
    required this.totalEarnings,
    required this.shareUrl,
    required this.whatsappUrl,
    required this.referrals,
  });

  final String referralCode;
  final int totalReferrals;
  final double totalEarnings;
  final String shareUrl;
  final String whatsappUrl;
  final List<ReferralItem> referrals;

  factory ReferralResponse.fromJson(Map<String, dynamic> json) {
    final summary = json['summary'] as Map<String, dynamic>? ?? <String, dynamic>{};
    final share = json['share'] as Map<String, dynamic>? ?? <String, dynamic>{};
    final items = (json['referrals'] as List<dynamic>? ?? <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .map(ReferralItem.fromJson)
        .toList();

    return ReferralResponse(
      referralCode: summary['referral_code'] as String? ?? '-',
      totalReferrals: (summary['total_referrals'] as num?)?.toInt() ?? 0,
      totalEarnings: (summary['total_earnings'] as num?)?.toDouble() ?? 0,
      shareUrl: share['share_url'] as String? ?? '',
      whatsappUrl: share['whatsapp_url'] as String? ?? '',
      referrals: items,
    );
  }
}

class ReferralItem {
  const ReferralItem({
    required this.id,
    required this.status,
    required this.signupRewardGiven,
    required this.purchaseRewardGiven,
    required this.joinedAt,
    required this.member,
  });

  final int id;
  final String status;
  final bool signupRewardGiven;
  final bool purchaseRewardGiven;
  final DateTime? joinedAt;
  final ReferralMember member;

  factory ReferralItem.fromJson(Map<String, dynamic> json) {
    return ReferralItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? 'pending',
      signupRewardGiven: json['signup_reward_given'] as bool? ?? false,
      purchaseRewardGiven: json['purchase_reward_given'] as bool? ?? false,
      joinedAt: DateTime.tryParse(json['joined_at']?.toString() ?? ''),
      member: ReferralMember.fromJson(
        json['referred_user'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
    );
  }
}

class ReferralMember {
  const ReferralMember({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatarUrl,
  });

  final int? id;
  final String name;
  final String? phone;
  final String? avatarUrl;

  factory ReferralMember.fromJson(Map<String, dynamic> json) {
    return ReferralMember(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String? ?? 'Member',
      phone: json['phone'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );
  }
}