class ReferralResponse {
  const ReferralResponse({
    required this.referralCode,
    required this.totalReferrals,
    required this.activeReferrals,
    required this.inactiveReferrals,
    required this.totalEarnings,
    required this.shareUrl,
    required this.whatsappUrl,
    required this.referrals,
    required this.teamStructure,
  });

  final String referralCode;
  final int totalReferrals;
  final int activeReferrals;
  final int inactiveReferrals;
  final double totalEarnings;
  final String shareUrl;
  final String whatsappUrl;
  final List<ReferralItem> referrals;
  final TeamStructureSummary teamStructure;

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
      activeReferrals: (summary['active_referrals'] as num?)?.toInt() ?? 0,
      inactiveReferrals: (summary['inactive_referrals'] as num?)?.toInt() ?? 0,
      totalEarnings: (summary['total_earnings'] as num?)?.toDouble() ?? 0,
      shareUrl: share['share_url'] as String? ?? '',
      whatsappUrl: share['whatsapp_url'] as String? ?? '',
      referrals: items,
      teamStructure: TeamStructureSummary.fromJson(
        summary['team_structure'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
    );
  }
}

class TeamStructureSummary {
  const TeamStructureSummary({
    required this.totalTeamSize,
    required this.maxDepth,
    required this.levels,
  });

  final int totalTeamSize;
  final int maxDepth;
  final List<TeamLevelSummary> levels;

  factory TeamStructureSummary.fromJson(Map<String, dynamic> json) {
    final levels = (json['levels'] as List<dynamic>? ?? <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .map(TeamLevelSummary.fromJson)
        .toList();

    return TeamStructureSummary(
      totalTeamSize: (json['total_team_size'] as num?)?.toInt() ?? 0,
      maxDepth: (json['max_depth'] as num?)?.toInt() ?? levels.length,
      levels: levels,
    );
  }
}

class TeamLevelSummary {
  const TeamLevelSummary({
    required this.level,
    required this.count,
    required this.members,
  });

  final int level;
  final int count;
  final List<ReferralMember> members;

  factory TeamLevelSummary.fromJson(Map<String, dynamic> json) {
    return TeamLevelSummary(
      level: (json['level'] as num?)?.toInt() ?? 0,
      count: (json['count'] as num?)?.toInt() ?? 0,
      members: (json['members'] as List<dynamic>? ?? <dynamic>[])
          .whereType<Map<String, dynamic>>()
          .map(ReferralMember.fromJson)
          .toList(),
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
