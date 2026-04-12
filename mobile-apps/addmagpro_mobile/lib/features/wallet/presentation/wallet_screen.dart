import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
import '../data/wallet_repository.dart';
import '../models/wallet_models.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key, required this.token});

  final String token;

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late final WalletRepository _repository;
  bool _loading = true;
  bool _submitting = false;
  String? _error;
  WalletOverview? _wallet;

  @override
  void initState() {
    super.initState();
    _repository = WalletRepository(apiClient: ApiClient());
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final wallet = await _repository.fetch(widget.token);
      if (!mounted) return;
      setState(() => _wallet = wallet);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  Future<void> _requestWithdraw() async {
    final controller = TextEditingController();
    final remarksController = TextEditingController();
    final amount = await showDialog<double>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Withdraw Request'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: controller,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: remarksController,
                decoration: const InputDecoration(labelText: 'Remarks (optional)'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop(double.tryParse(controller.text.trim()));
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );

    if (amount == null) {
      return;
    }

    setState(() {
      _submitting = true;
      _error = null;
    });

    try {
      await _repository.submitWithdraw(
        widget.token,
        amount: amount,
        remarks: remarksController.text.trim(),
      );
      await _load();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Withdraw request submitted')),
      );
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }

  Future<void> _createTopupOrder() async {
    final amount = await showDialog<int>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create Top-up Order'),
          content: const Text('Select a top-up amount. Payment verification can use the returned Razorpay order id.'),
          actions: <Widget>[
            for (final option in _wallet?.presetAmounts ?? <int>[100, 200, 500])
              TextButton(
                onPressed: () => Navigator.of(context).pop(option),
                child: Text('₹$option'),
              ),
          ],
        );
      },
    );

    if (amount == null) return;

    try {
      final order = await _repository.createTopupOrder(widget.token, amount: amount);
      if (!mounted) return;
      showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Razorpay Order Created'),
          content: Text('Order ID: ${order.orderId}\nAmount: ${order.amount / 100} ${order.currency}\nKey: ${order.keyId}'),
          actions: <Widget>[
            FilledButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close')),
          ],
        ),
      );
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(_error!, style: const TextStyle(color: Color(0xFFB42318))),
        ),
      );
    }

    final wallet = _wallet;
    if (wallet == null) {
      return const Center(child: Text('Wallet data unavailable'));
    }

    return RefreshIndicator(
      onRefresh: _load,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Wallet balance', style: TextStyle(color: Color(0xFF9CA3AF))),
                const SizedBox(height: 10),
                Text(
                  '₹${wallet.balance.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 34,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Live account data from your AddMagPro wallet.',
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
                  onPressed: _createTopupOrder,
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
                  onPressed: _submitting ? null : _requestWithdraw,
                  style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
                  child: Text(_submitting ? 'Submitting...' : 'Withdraw'),
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
          if (wallet.transactions.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('No transactions found'),
            ),
          for (final transaction in wallet.transactions) _WalletTransactionCard(item: transaction),
          const SizedBox(height: 8),
          Text(
            'Withdraw requests',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 12),
          if (wallet.withdrawRequests.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('No withdraw requests yet'),
            ),
          for (final withdrawRequest in wallet.withdrawRequests) _WithdrawCard(item: withdrawRequest),
        ],
      ),
    );
  }
}

class _WalletTransactionCard extends StatelessWidget {
  const _WalletTransactionCard({required this.item});

  final WalletTransactionItem item;

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
                Text(_formatDate(item.createdAt), style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
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

  String _formatDate(DateTime? value) {
    if (value == null) return '-';
    final local = value.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/${local.month.toString().padLeft(2, '0')}/${local.year}';
  }
}

class _WithdrawCard extends StatelessWidget {
  const _WithdrawCard({required this.item});

  final WithdrawRequestItem item;

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