import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_widgets.dart';
import '../data/referral_repository.dart';
import '../models/referral_models.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({
    super.key,
    required this.token,
    required this.memberName,
  });

  final String token;
  final String memberName;

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  late final ReferralRepository _repository;
  bool _loading = true;
  String? _error;
  ReferralResponse? _data;

  @override
  void initState() {
    super.initState();
    _repository = ReferralRepository(apiClient: ApiClient());
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final data = await _repository.fetch(widget.token);
      if (!mounted) return;
      setState(() => _data = data);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _copyCode() async {
    final code = _data?.referralCode;
    if (code == null || code.isEmpty) return;
    await Clipboard.setData(ClipboardData(text: code));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Referral code copied!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _shareCode() {
    final data = _data;
    if (data == null) return;
    final text = data.shareUrl.isNotEmpty
        ? 'Join AddMagPro using my referral code: ${data.referralCode}\n${data.shareUrl}'
        : 'Join AddMagPro using my referral code: ${data.referralCode}';
    SharePlus.instance.share(ShareParams(text: text));
  }

  Future<void> _shareWhatsApp() async {
    final url = _data?.whatsappUrl;
    if (url == null || url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Referral Network')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 48,
              color: AppColors.textMuted,
            ),
            const SizedBox(height: 12),
            Text(_error!, style: const TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 12),
            FilledButton.tonal(onPressed: _load, child: const Text('Retry')),
          ],
        ),
      );
    }

    final data = _data;
    if (data == null) {
      return const Center(child: Text('No referral data available'));
    }

    final grouped = <int, List<TeamNode>>{};
    for (final node in data.teamStructure) {
      grouped.putIfAbsent(node.depth, () => <TeamNode>[]).add(node);
    }
    final sortedLevels = grouped.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: _load,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Referral Header Card ──
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withAlpha(40),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(color: Colors.white.withAlpha(25), borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.groups_2_rounded, color: Colors.white, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Grow your team', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 2),
                          Text(
                            '${widget.memberName}, share & earn rewards',
                            style: const TextStyle(color: Colors.white70, fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    _BalanceStat(label: 'Referrals', value: '${data.totalReferrals}', icon: Icons.people_rounded, iconColor: Colors.white),
                    const SizedBox(width: 12),
                    _BalanceStat(label: 'Earnings', value: '₹${data.totalEarnings.toStringAsFixed(0)}', icon: Icons.currency_rupee_rounded, iconColor: Colors.greenAccent),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _BalanceStat(label: 'Active', value: '${data.activeReferrals}', icon: Icons.check_circle_rounded, iconColor: Colors.greenAccent),
                    const SizedBox(width: 12),
                    _BalanceStat(label: 'Inactive', value: '${data.inactiveReferrals}', icon: Icons.cancel_rounded, iconColor: Colors.redAccent),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ── Referral Code Card ──
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Your referral code', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data.referralCode,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    FilledButton.tonal(
                      onPressed: _copyCode,
                      child: const Text('Copy'),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _shareWhatsApp,
                        icon: const Icon(Icons.chat_rounded, size: 18),
                        label: const Text('WhatsApp'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          minimumSize: const Size(0, 44),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: _shareCode,
                        icon: const Icon(Icons.share_rounded, size: 18),
                        label: const Text('Share'),
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          minimumSize: const Size(0, 44),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _TeamStructureCard(summary: TeamStructureSummary.fromNodes(data.teamStructure)),
          const SizedBox(height: 20),
          // ── Team Structure ──
          SectionHeader(title: 'Team Structure', padding: EdgeInsets.zero),
          const SizedBox(height: 10),
          if (grouped.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Text(
                'No team members yet.',
                style: TextStyle(color: AppColors.textMuted),
              ),
            )
          else ...[
            if (data.levelSummary.isNotEmpty)
              SizedBox(
                height: 118,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.levelSummary.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 10),
                  itemBuilder: (context, index) =>
                      _LevelSummaryCard(level: data.levelSummary[index]),
                ),
              ),
            const SizedBox(height: 10),
            ...sortedLevels
                .map((entry) => _LevelGroupCard(level: entry.key, nodes: entry.value)),
          ],
          const SizedBox(height: 16),
          // ── Referral History ──
          SectionHeader(title: 'Referral History', padding: EdgeInsets.zero),
          const SizedBox(height: 4),
          Text(
            '${data.referrals.length} members',
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          if (data.referrals.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text(
                  'No referrals yet',
                  style: TextStyle(color: AppColors.textMuted),
                ),
              ),
            )
          else
            for (final referral in data.referrals) _ReferralCard(item: referral),
        ],
      ),
    );
  }
}

class _TeamStructureCard extends StatelessWidget {
  const _TeamStructureCard({required this.summary});

  final TeamStructureSummary summary;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
        title: const Text(
          'Team Structure',
          style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.textPrimary),
        ),
        subtitle: Text(
          '${summary.totalTeamSize} members • ${summary.maxDepth} levels',
          style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
        ),
        children: [
          if (summary.levels.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text('No team members yet', style: TextStyle(color: AppColors.textMuted)),
            )
          else
            for (final level in summary.levels) ...[
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Level ${level.level} • ${level.count} members',
                      style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                    ),
                    const SizedBox(height: 8),
                    ...level.members.map((member) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: AppColors.primaryLight,
                            backgroundImage: member.avatarUrl != null ? NetworkImage(member.avatarUrl!) : null,
                            child: member.avatarUrl == null
                                ? Text(
                                    member.name.characters.first,
                                    style: const TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '${member.name} (${member.phone ?? '-'})',
                              style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ],
        ],
      ),
    );
  }
}

class _LevelSummaryCard extends StatelessWidget {
  const _LevelSummaryCard({required this.level});

  final LevelSummary level;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Level ${level.depth}',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${level.members} members • ${level.activeMembers} active',
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          Text(
            '${level.inactiveMembers} inactive',
            style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
          ),
          const Spacer(),
          Text(
            '₹${level.earnings.toStringAsFixed(2)} earned',
            style: const TextStyle(
              color: AppColors.success,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelGroupCard extends StatelessWidget {
  const _LevelGroupCard({required this.level, required this.nodes});

  final int level;
  final List<TeamNode> nodes;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: AppColors.borderLight),
      ),
      child: ExpansionTile(
        title: Text('Level $level Team'),
        subtitle: Text('${nodes.length} members'),
        childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        children: nodes.map((node) => _TeamNodeTile(node: node)).toList(),
      ),
    );
  }
}

class _TeamNodeTile extends StatelessWidget {
  const _TeamNodeTile({required this.node});

  final TeamNode node;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.surface,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryLight,
                backgroundImage: node.member.avatarUrl != null
                    ? NetworkImage(node.member.avatarUrl!)
                    : null,
                child: node.member.avatarUrl == null
                    ? Text(
                        node.member.name.characters.first,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      node.member.name,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Parent ${node.parentId ?? '-'} • Child ${node.childId ?? '-'}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                _formatDate(node.joinedAt),
                style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _StatusChip(
                label: node.member.isActive ? 'Active' : 'Inactive',
                success: node.member.isActive,
              ),
              const SizedBox(width: 8),
              _StatusChip(
                label: node.status == 'active' ? 'Referral Active' : 'Referral Pending',
                success: node.status == 'active',
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime? value) {
    if (value == null) return '-';
    final local = value.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/${local.month.toString().padLeft(2, '0')}/${local.year}';
  }
}

class _ReferralCard extends StatelessWidget {
  const _ReferralCard({required this.item});

  final ReferralItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryLight,
                backgroundImage: item.member.avatarUrl != null
                    ? NetworkImage(item.member.avatarUrl!)
                    : null,
                child: item.member.avatarUrl == null
                    ? Text(
                        item.member.name.characters.first,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.member.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      item.member.phone ?? '-',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                _formatDate(item.joinedAt),
                style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _StatusChip(
                label: item.member.isActive ? 'Member active' : 'Member inactive',
                success: item.member.isActive,
              ),
              _StatusChip(
                label:
                    item.signupRewardGiven ? 'Signup reward given' : 'Signup reward pending',
                success: item.signupRewardGiven,
              ),
              _StatusChip(
                label: item.purchaseRewardGiven
                    ? 'Purchase reward given'
                    : 'Purchase reward pending',
                success: item.purchaseRewardGiven,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime? value) {
    if (value == null) return '-';
    final local = value.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/${local.month.toString().padLeft(2, '0')}/${local.year}';
  }
}

class _BalanceStat extends StatelessWidget {
  const _BalanceStat({required this.label, required this.value, required this.icon, required this.iconColor});
  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(25),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 16),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
                Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, required this.success});

  final String label;
  final bool success;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: success ? AppColors.success.withAlpha(20) : AppColors.surface,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: success ? AppColors.success : AppColors.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
