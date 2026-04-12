import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const transactions = <_WalletTransactionItem>[
      _WalletTransactionItem(
        description: 'Referral bonus credited',
        timestamp: '2 hours ago',
        amount: 500,
        isCredit: true,
      ),
      _WalletTransactionItem(
        description: 'Withdrawal request submitted',
        timestamp: 'Yesterday',
        amount: 1200,
        isCredit: false,
      ),
      _WalletTransactionItem(
        description: 'First purchase incentive',
        timestamp: '3 days ago',
        amount: 750,
        isCredit: true,
      ),
    ];

    const withdrawRequests = <_WithdrawRequestItem>[
      _WithdrawRequestItem(requestNo: 'WDR-82D8AC19', amount: 1200, status: 'pending'),
      _WithdrawRequestItem(requestNo: 'WDR-AC39FE11', amount: 950, status: 'approved'),
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF111827),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Wallet balance', style: TextStyle(color: Color(0xFF9CA3AF))),
              SizedBox(height: 10),
              Text(
                '₹18,340.00',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 34,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Temporary mock data while API modules are being completed.',
                style: TextStyle(color: Color(0xFFD1D5DB), height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: <Widget>[
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                  backgroundColor: Colors.white,
                ),
                child: const Text('Top up'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
                child: const Text('Withdraw'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        Text(
          'Recent transactions',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: 12),
        for (final transaction in transactions) _WalletTransactionCard(item: transaction),
        const SizedBox(height: 8),
        Text(
          'Withdraw requests',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: 12),
        for (final withdrawRequest in withdrawRequests) _WithdrawCard(item: withdrawRequest),
      ],
    );
  }
}

class _WalletTransactionCard extends StatelessWidget {
  const _WalletTransactionCard({required this.item});

  final _WalletTransactionItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: item.isCredit ? const Color(0xFFECFDF3) : const Color(0xFFFEF3F2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              item.isCredit ? Icons.south_west_rounded : Icons.north_east_rounded,
              color: item.isCredit ? const Color(0xFF067647) : const Color(0xFFB42318),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.description, style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(item.timestamp, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
              ],
            ),
          ),
          Text(
            '${item.isCredit ? '+' : '-'}₹${item.amount.toStringAsFixed(0)}',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: item.isCredit ? const Color(0xFF067647) : const Color(0xFFB42318),
            ),
          ),
        ],
      ),
    );
  }
}

class _WithdrawCard extends StatelessWidget {
  const _WithdrawCard({required this.item});

  final _WithdrawRequestItem item;

  @override
  Widget build(BuildContext context) {
    final approved = item.status == 'approved';
    final pending = item.status == 'pending';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.requestNo, style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text('₹${item.amount.toStringAsFixed(0)}', style: const TextStyle(color: Color(0xFF6B7280))),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: approved
                  ? const Color(0xFFECFDF3)
                  : pending
                      ? const Color(0xFFFFF7ED)
                      : const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              item.status,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: approved
                    ? const Color(0xFF067647)
                    : pending
                        ? const Color(0xFFB54708)
                        : const Color(0xFF4B5563),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletTransactionItem {
  const _WalletTransactionItem({
    required this.description,
    required this.timestamp,
    required this.amount,
    required this.isCredit,
  });

  final String description;
  final String timestamp;
  final double amount;
  final bool isCredit;
}

class _WithdrawRequestItem {
  const _WithdrawRequestItem({
    required this.requestNo,
    required this.amount,
    required this.status,
  });

  final String requestNo;
  final double amount;
  final String status;
}