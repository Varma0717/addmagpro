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
    required this.levelSummary,
  });

  final String referralCode;
  final int totalReferrals;
  final int activeReferrals;
  final int inactiveReferrals;
  final double totalEarnings;
  final String shareUrl;
  final String whatsappUrl;
  final List<ReferralItem> referrals;
  final List<TeamNode> teamStructure;
  final List<LevelSummary> levelSummary;

  factory ReferralResponse.fromJson(Map<String, dynamic> json) {
    final summary = json['summary'] as Map<String, dynamic>? ?? <String, dynamic>{};
    final share = json['share'] as Map<String, dynamic>? ?? <String, dynamic>{};
    final items = (json['referrals'] as List<dynamic>? ?? <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .map(ReferralItem.fromJson)
        .toList();
    final team = (json['team_structure'] as List<dynamic>? ?? <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .map(TeamNode.fromJson)
        .toList();
    final summaryByLevel = (json['level_summary'] as List<dynamic>? ?? <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .map(LevelSummary.fromJson)
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
      teamStructure: team,
      levelSummary: summaryByLevel,
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
    required this.parentId,
    required this.childId,
    required this.depth,
  });

  final int id;
  final String status;
  final bool signupRewardGiven;
  final bool purchaseRewardGiven;
  final DateTime? joinedAt;
  final ReferralMember member;
  final int? parentId;
  final int? childId;
  final int depth;

  factory ReferralItem.fromJson(Map<String, dynamic> json) {
    final team = json['team'] as Map<String, dynamic>? ?? <String, dynamic>{};

    return ReferralItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? 'pending',
      signupRewardGiven: json['signup_reward_given'] as bool? ?? false,
      purchaseRewardGiven: json['purchase_reward_given'] as bool? ?? false,
      joinedAt: DateTime.tryParse(json['joined_at']?.toString() ?? ''),
      member: ReferralMember.fromJson(
        json['referred_user'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      parentId: (team['parent_id'] as num?)?.toInt(),
      childId: (team['child_id'] as num?)?.toInt(),
      depth: (team['depth'] as num?)?.toInt() ?? 1,
    );
  }
}

class TeamNode {
  const TeamNode({
    required this.id,
    required this.parentId,
    required this.childId,
    required this.depth,
    required this.status,
    required this.signupRewardGiven,
    required this.purchaseRewardGiven,
    required this.joinedAt,
    required this.member,
  });

  final int id;
  final int? parentId;
  final int? childId;
  final int depth;
  final String status;
  final bool signupRewardGiven;
  final bool purchaseRewardGiven;
  final DateTime? joinedAt;
  final ReferralMember member;

  factory TeamNode.fromJson(Map<String, dynamic> json) {
    return TeamNode(
      id: (json['id'] as num?)?.toInt() ?? 0,
      parentId: (json['parent_id'] as num?)?.toInt(),
      childId: (json['child_id'] as num?)?.toInt(),
      depth: (json['depth'] as num?)?.toInt() ?? 1,
      status: json['status'] as String? ?? 'pending',
      signupRewardGiven: json['signup_reward_given'] as bool? ?? false,
      purchaseRewardGiven: json['purchase_reward_given'] as bool? ?? false,
      joinedAt: DateTime.tryParse(json['joined_at']?.toString() ?? ''),
      member: ReferralMember.fromJson(
        json['member'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
    );
  }
}

class LevelSummary {
  const LevelSummary({
    required this.depth,
    required this.members,
    required this.activeMembers,
    required this.inactiveMembers,
    required this.earnings,
  });

  final int depth;
  final int members;
  final int activeMembers;
  final int inactiveMembers;
  final double earnings;

  factory LevelSummary.fromJson(Map<String, dynamic> json) {
    return LevelSummary(
      depth: (json['depth'] as num?)?.toInt() ?? 1,
      members: (json['members'] as num?)?.toInt() ?? 0,
      activeMembers: (json['active_members'] as num?)?.toInt() ?? 0,
      inactiveMembers: (json['inactive_members'] as num?)?.toInt() ?? 0,
      earnings: (json['earnings'] as num?)?.toDouble() ?? 0,
    );
  }
}

class ReferralMember {
  const ReferralMember({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatarUrl,
    required this.isActive,
  });

  final int? id;
  final String name;
  final String? phone;
  final String? avatarUrl;
  final bool isActive;

  factory ReferralMember.fromJson(Map<String, dynamic> json) {
    return ReferralMember(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String? ?? 'Member',
      phone: json['phone'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      isActive: json['is_active'] as bool? ?? false,
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
  final List<TeamStructureLevel> levels;

  factory TeamStructureSummary.fromNodes(List<TeamNode> nodes) {
    if (nodes.isEmpty) {
      return const TeamStructureSummary(totalTeamSize: 0, maxDepth: 0, levels: []);
    }
    final grouped = <int, List<TeamNode>>{};
    for (final node in nodes) {
      grouped.putIfAbsent(node.depth, () => <TeamNode>[]).add(node);
    }
    final levels = grouped.entries
        .toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    return TeamStructureSummary(
      totalTeamSize: nodes.length,
      maxDepth: levels.last.key,
      levels: levels
          .map((e) => TeamStructureLevel(
                level: e.key,
                count: e.value.length,
                members: e.value.map((n) => n.member).toList(),
              ))
          .toList(),
    );
  }
}

class TeamStructureLevel {
  const TeamStructureLevel({
    required this.level,
    required this.count,
    required this.members,
  });

  final int level;
  final int count;
  final List<ReferralMember> members;
}
