import 'package:flutter/material.dart';

import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../orders/data/order_repository.dart';
import '../../orders/models/order_models.dart';
import '../../wallet/data/wallet_repository.dart';
import '../../wallet/models/wallet_models.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key, required this.token});

  final String token;

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  late final WalletRepository _walletRepository;
  late final OrderRepository _orderRepository;

  bool _loading = true;
  String? _error;
  List<WalletTransactionItem> _walletTransactions = const <WalletTransactionItem>[];
  List<OrderSummary> _orders = const <OrderSummary>[];

  @override
  void initState() {
    super.initState();
    final apiClient = ApiClient();
    _walletRepository = WalletRepository(apiClient: apiClient);
    _orderRepository = OrderRepository(apiClient: apiClient);
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final walletFuture = _walletRepository.fetch(widget.token);
      final ordersFuture = _orderRepository.fetch(widget.token);
      final results = await Future.wait<dynamic>([walletFuture, ordersFuture]);
      if (!mounted) return;
      setState(() {
        _walletTransactions = (results[0] as WalletOverview).transactions;
        _orders = results[1] as List<OrderSummary>;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _load,
        child: _loading
            ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
            : _error != null
                ? ListView(
                    padding: const EdgeInsets.all(24),
                    children: [
                      EmptyState(
                        icon: Icons.error_outline_rounded,
                        title: 'Unable to load transactions',
                        subtitle: _error,
                        actionLabel: 'Retry',
                        onAction: _load,
                      ),
                    ],
                  )
                : _walletTransactions.isEmpty && _orders.isEmpty
                    ? ListView(
                        children: const [
                          EmptyState(
                            icon: Icons.swap_horiz_rounded,
                            title: 'No transactions yet',
                            subtitle: 'Wallet and order transaction history will appear here.',
                          ),
                        ],
                      )
                    : ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          const Text(
                            'Wallet Transactions',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.textPrimary),
                          ),
                          const SizedBox(height: 10),
                          if (_walletTransactions.isEmpty)
                            const _MiniEmptyCard(label: 'No wallet transactions yet')
                          else
                            ..._walletTransactions.map((item) => _WalletTransactionCard(item: item)),
                          const SizedBox(height: 18),
                          const Text(
                            'Order Payments',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.textPrimary),
                          ),
                          const SizedBox(height: 10),
                          if (_orders.isEmpty)
                            const _MiniEmptyCard(label: 'No order transactions yet')
                          else
                            ..._orders.map((order) => _OrderTransactionCard(item: order)),
                        ],
                      ),
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
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: item.isCredit ? AppColors.success.withAlpha(18) : AppColors.error.withAlpha(18),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              item.isCredit ? Icons.south_west_rounded : Icons.north_east_rounded,
              color: item.isCredit ? AppColors.success : AppColors.error,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.description, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                const SizedBox(height: 3),
                Text(_formatDate(item.createdAt), style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '${item.isCredit ? '+' : '-'}₹${item.amount.toStringAsFixed(0)}',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: item.isCredit ? AppColors.success : AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderTransactionCard extends StatelessWidget {
  const _OrderTransactionCard({required this.item});

  final OrderSummary item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.receipt_long_rounded, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.orderNumber, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                const SizedBox(height: 3),
                Text(_formatDate(item.createdAt), style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('₹${item.total.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primary)),
              const SizedBox(height: 2),
              StatusChip(label: item.paymentStatus ?? item.status),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniEmptyCard extends StatelessWidget {
  const _MiniEmptyCard({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
    );
  }
}

String _formatDate(DateTime? value) {
  if (value == null) return '-';
  final local = value.toLocal();
  return '${local.day.toString().padLeft(2, '0')}/${local.month.toString().padLeft(2, '0')}/${local.year}';
}
