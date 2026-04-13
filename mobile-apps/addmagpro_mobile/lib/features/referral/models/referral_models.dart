class ReferralResponse {
  const ReferralResponse({
    required this.referralCode,
    required this.totalReferrals,
    required this.totalEarnings,
    required this.shareUrl,
    required this.whatsappUrl,
    required this.referrals,
    this.team,
  });

  final String referralCode;
  final int totalReferrals;
  final double totalEarnings;
  final String shareUrl;
  final String whatsappUrl;
  final List<ReferralItem> referrals;
  final ReferralTeamResponse? team;

  factory ReferralResponse.fromJson(
    Map<String, dynamic> json, {
    ReferralTeamResponse? team,
  }) {
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
      team: team,
    );
  }
}

class ReferralTeamResponse {
  const ReferralTeamResponse({
    required this.depth,
    required this.totalTeam,
    required this.levels,
    required this.members,
    required this.parentChildMap,
  });

  final int depth;
  final int totalTeam;
  final List<ReferralLevelStat> levels;
  final List<ReferralTeamMember> members;
  final Map<int, List<int>> parentChildMap;

  factory ReferralTeamResponse.fromJson(Map<String, dynamic> json) {
    final levels = (json['levels'] as List<dynamic>? ?? <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .map(ReferralLevelStat.fromJson)
        .toList();
    final members = (json['members'] as List<dynamic>? ?? <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .map(ReferralTeamMember.fromJson)
        .toList();
    final rawMap = json['parent_child_map'] as Map<String, dynamic>? ?? <String, dynamic>{};
    final parentChildMap = <int, List<int>>{};

    for (final entry in rawMap.entries) {
      final parentId = int.tryParse(entry.key);
      if (parentId == null) continue;
      final children = (entry.value as List<dynamic>? ?? <dynamic>[])
          .map((item) => (item as num?)?.toInt())
          .whereType<int>()
          .toList();
      parentChildMap[parentId] = children;
    }

    return ReferralTeamResponse(
      depth: (json['depth'] as num?)?.toInt() ?? 0,
      totalTeam: (json['total_team'] as num?)?.toInt() ?? members.length,
      levels: levels,
      members: members,
      parentChildMap: parentChildMap,
    );
  }
}

class ReferralLevelStat {
  const ReferralLevelStat({
    required this.level,
    required this.count,
    required this.earnings,
  });

  final int level;
  final int count;
  final double earnings;

  factory ReferralLevelStat.fromJson(Map<String, dynamic> json) {
    return ReferralLevelStat(
      level: (json['level'] as num?)?.toInt() ?? 0,
      count: (json['count'] as num?)?.toInt() ?? 0,
      earnings: (json['earnings'] as num?)?.toDouble() ?? 0,
    );
  }
}

class ReferralTeamMember {
  const ReferralTeamMember({
    required this.id,
    required this.level,
    required this.parentUserId,
    required this.childUserId,
    required this.status,
    required this.joinedAt,
    required this.earning,
    required this.member,
  });

  final int id;
  final int level;
  final int? parentUserId;
  final int? childUserId;
  final String status;
  final DateTime? joinedAt;
  final double earning;
  final ReferralMember member;

  factory ReferralTeamMember.fromJson(Map<String, dynamic> json) {
    return ReferralTeamMember(
      id: (json['id'] as num?)?.toInt() ?? 0,
      level: (json['level'] as num?)?.toInt() ?? 0,
      parentUserId: (json['parent_user_id'] as num?)?.toInt(),
      childUserId: (json['child_user_id'] as num?)?.toInt(),
      status: json['status'] as String? ?? 'pending',
      joinedAt: DateTime.tryParse(json['joined_at']?.toString() ?? ''),
      earning: (json['earning'] as num?)?.toDouble() ?? 0,
      member: ReferralMember.fromJson(
        json['member'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
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
