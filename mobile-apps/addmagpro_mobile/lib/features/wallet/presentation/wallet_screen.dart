import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_widgets.dart';
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
  late final Razorpay _razorpay;
  bool _loading = true;
  bool _submitting = false;
  String? _error;
  WalletOverview? _wallet;
  int? _pendingTopupAmount;

  @override
  void initState() {
    super.initState();
    _repository = WalletRepository(apiClient: ApiClient());
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handleTopupSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handleTopupError);
    _load();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    try {
      final wallet = await _repository.fetch(widget.token);
      if (!mounted) return;
      setState(() => _wallet = wallet);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _handleTopupSuccess(PaymentSuccessResponse response) async {
    try {
      await _repository.verifyTopup(
        widget.token,
        razorpayOrderId: response.orderId ?? '',
        razorpayPaymentId: response.paymentId ?? '',
        razorpaySignature: response.signature ?? '',
        amount: _pendingTopupAmount ?? 0,
      );
      await _load();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('₹${_pendingTopupAmount ?? 0} added to wallet!'), behavior: SnackBarBehavior.floating, backgroundColor: AppColors.success),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Verification failed: $error')));
    }
    _pendingTopupAmount = null;
  }

  void _handleTopupError(PaymentFailureResponse response) {
    _pendingTopupAmount = null;
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment failed: ${response.message ?? 'Unknown error'}'), backgroundColor: AppColors.error),
    );
  }

  Future<void> _requestWithdraw() async {
    final controller = TextEditingController();
    final remarksController = TextEditingController();
    final amount = await showModalBottomSheet<double>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2)))),
              const SizedBox(height: 20),
              const Text('Withdraw Request', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 16),
              TextField(
                controller: controller,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Amount (₹)', prefixIcon: Icon(Icons.currency_rupee_rounded)),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: remarksController,
                decoration: const InputDecoration(labelText: 'Remarks (optional)', prefixIcon: Icon(Icons.notes_rounded)),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(double.tryParse(controller.text.trim())),
                style: FilledButton.styleFrom(minimumSize: const Size(double.infinity, 52)),
                child: const Text('Submit Withdraw'),
              ),
            ],
          ),
        );
      },
    );

    if (amount == null) return;

    setState(() { _submitting = true; _error = null; });
    try {
      await _repository.submitWithdraw(widget.token, amount: amount, remarks: remarksController.text.trim());
      await _load();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Withdraw request submitted'), behavior: SnackBarBehavior.floating, backgroundColor: AppColors.success),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  Future<void> _startTopup() async {
    final presets = _wallet?.presetAmounts ?? [100, 200, 500];
    final customController = TextEditingController();
    final amount = await showModalBottomSheet<int>(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(context).viewInsets.bottom + 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2)))),
              const SizedBox(height: 20),
              const Text('Top Up Wallet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              const Text('Select an amount or enter custom', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
              const SizedBox(height: 18),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: presets.map((amt) => OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(amt),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text('₹$amt', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.primary)),
                )).toList(),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: customController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Custom amount (₹)', prefixIcon: Icon(Icons.edit_rounded)),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(int.tryParse(customController.text.trim())),
                style: FilledButton.styleFrom(minimumSize: const Size(double.infinity, 52)),
                child: const Text('Proceed to Pay'),
              ),
            ],
          ),
        );
      },
    );

    if (amount == null || amount <= 0) return;

    try {
      _pendingTopupAmount = amount;
      final order = await _repository.createTopupOrder(widget.token, amount: amount);
      final options = <String, dynamic>{
        'key': order.keyId,
        'amount': order.amount,
        'currency': order.currency,
        'order_id': order.orderId,
        'name': 'AddMagPro',
        'description': 'Wallet Top-up ₹$amount',
        'theme': {'color': '#FF7F11'},
      };
      _razorpay.open(options);
    } catch (error) {
      _pendingTopupAmount = null;
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  double _totalCredits(WalletOverview wallet) {
    return wallet.transactions.where((t) => t.isCredit).fold(0.0, (sum, t) => sum + t.amount);
  }

  double _totalDebits(WalletOverview wallet) {
    return wallet.transactions.where((t) => !t.isCredit).fold(0.0, (sum, t) => sum + t.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }

    if (_error != null) {
      return Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.textMuted),
        const SizedBox(height: 12),
        Text(_error!, style: const TextStyle(color: AppColors.textMuted), textAlign: TextAlign.center),
        const SizedBox(height: 12),
        FilledButton.tonal(onPressed: _load, child: const Text('Retry')),
      ]));
    }

    final wallet = _wallet;
    if (wallet == null) {
      return const EmptyState(icon: Icons.account_balance_wallet_outlined, title: 'Wallet unavailable');
    }

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: _load,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Balance Card ──
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [BoxShadow(color: AppColors.primary.withAlpha(40), blurRadius: 16, offset: const Offset(0, 6))],
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
                      child: const Icon(Icons.account_balance_wallet_rounded, color: Colors.white, size: 22),
                    ),
                    const SizedBox(width: 12),
                    const Text('Available Balance', style: TextStyle(color: Colors.white70, fontSize: 14)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.white.withAlpha(20), borderRadius: BorderRadius.circular(8)),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.verified_rounded, color: Colors.greenAccent, size: 14),
                          SizedBox(width: 4),
                          Text('Active', style: TextStyle(color: Colors.greenAccent, fontSize: 11, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text('₹${wallet.balance.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 38)),
                const SizedBox(height: 16),
                // Quick stats
                Row(
                  children: [
                    _BalanceStat(label: 'Credited', value: '₹${_totalCredits(wallet).toStringAsFixed(0)}', icon: Icons.south_west_rounded, iconColor: Colors.greenAccent),
                    const SizedBox(width: 16),
                    _BalanceStat(label: 'Debited', value: '₹${_totalDebits(wallet).toStringAsFixed(0)}', icon: Icons.north_east_rounded, iconColor: Colors.redAccent),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ── Action Buttons ──
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _startTopup,
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('Top Up'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 52),
                    side: const BorderSide(color: AppColors.primary),
                    foregroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _submitting ? null : _requestWithdraw,
                  icon: const Icon(Icons.arrow_upward_rounded),
                  label: Text(_submitting ? 'Submitting...' : 'Withdraw'),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(0, 52),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ── Transactions ──
          SectionHeader(title: 'Recent Transactions', padding: EdgeInsets.zero),
          const SizedBox(height: 12),
          if (wallet.transactions.isEmpty)
            const Padding(padding: EdgeInsets.symmetric(vertical: 24), child: Center(child: Text('No transactions yet', style: TextStyle(color: AppColors.textMuted))))
          else
            ...wallet.transactions.map((t) => _WalletTransactionCard(item: t)),
          const SizedBox(height: 20),

          // ── Withdraw Requests ──
          SectionHeader(title: 'Withdraw Requests', padding: EdgeInsets.zero),
          const SizedBox(height: 12),
          if (wallet.withdrawRequests.isEmpty)
            const Padding(padding: EdgeInsets.symmetric(vertical: 24), child: Center(child: Text('No withdraw requests yet', style: TextStyle(color: AppColors.textMuted))))
          else
            ...wallet.withdrawRequests.map((w) => _WithdrawCard(item: w)),
          const SizedBox(height: 16),
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
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: item.isCredit ? const Color(0xFFECFDF3) : const Color(0xFFFEF3F2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              item.isCredit ? Icons.south_west_rounded : Icons.north_east_rounded,
              color: item.isCredit ? AppColors.success : AppColors.error,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.description, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textPrimary)),
                const SizedBox(height: 3),
                Text(_formatDate(item.createdAt), style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
          Text(
            '${item.isCredit ? '+' : '-'}₹${item.amount.toStringAsFixed(0)}',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: item.isCredit ? AppColors.success : AppColors.error),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.requestNo, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textPrimary)),
                const SizedBox(height: 3),
                Text('₹${item.amount.toStringAsFixed(0)}', style: const TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          StatusChip(label: item.status),
        ],
      ),
    );
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
                Text(label, style: const TextStyle(color: Colors.white60, fontSize: 11)),
                Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}