import 'package:flutter/material.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({
    super.key,
    required this.referralCode,
    required this.memberName,
  });

  final String referralCode;
  final String memberName;

  @override
  Widget build(BuildContext context) {
    const referrals = <_ReferralItem>[
      _ReferralItem(
        name: 'Srinivas Rao',
        phone: '9876543210',
        joinedAt: '09 Apr 2026',
        signupRewardGiven: true,
        purchaseRewardGiven: false,
      ),
      _ReferralItem(
        name: 'Lakshmi Devi',
        phone: '9012345678',
        joinedAt: '05 Apr 2026',
        signupRewardGiven: true,
        purchaseRewardGiven: true,
      ),
      _ReferralItem(
        name: 'Vamsi Krishna',
        phone: '9123456780',
        joinedAt: '29 Mar 2026',
        signupRewardGiven: false,
        purchaseRewardGiven: false,
      ),
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: <Color>[Color(0xFFFF7F11), Color(0xFFF45D01)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Grow your team',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                '$memberName, share your referral code and track joining rewards.',
                style: const TextStyle(color: Colors.white70, height: 1.4),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Your referral code',
                          style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          referralCode,
                          style: const TextStyle(
                            color: Color(0xFF111827),
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    FilledButton.tonal(
                      onPressed: () {},
                      child: const Text('Copy'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: _SummaryCard(label: 'Referrals', value: '24'),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _SummaryCard(label: 'Earnings', value: '₹12,480'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Referral history',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const Text(
              'Mock data',
              style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 12),
        for (final referral in referrals) _ReferralCard(item: referral),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReferralCard extends StatelessWidget {
  const _ReferralCard({required this.item});

  final _ReferralItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: const Color(0xFFFFE2C7),
                child: Text(item.name.characters.first),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                    Text(item.phone, style: const TextStyle(color: Color(0xFF6B7280))),
                  ],
                ),
              ),
              Text(item.joinedAt, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              _StatusChip(
                label: item.signupRewardGiven ? 'Signup reward given' : 'Signup reward pending',
                success: item.signupRewardGiven,
              ),
              _StatusChip(
                label: item.purchaseRewardGiven ? 'Purchase reward given' : 'Purchase reward pending',
                success: item.purchaseRewardGiven,
              ),
            ],
          ),
        ],
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
        color: success ? const Color(0xFFECFDF3) : const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: success ? const Color(0xFF067647) : const Color(0xFF4B5563),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ReferralItem {
  const _ReferralItem({
    required this.name,
    required this.phone,
    required this.joinedAt,
    required this.signupRewardGiven,
    required this.purchaseRewardGiven,
  });

  final String name;
  final String phone;
  final String joinedAt;
  final bool signupRewardGiven;
  final bool purchaseRewardGiven;
}