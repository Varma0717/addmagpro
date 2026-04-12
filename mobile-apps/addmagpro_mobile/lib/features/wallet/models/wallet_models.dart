class WalletOverview {
  const WalletOverview({
    required this.balance,
    required this.presetAmounts,
    required this.transactions,
    required this.withdrawRequests,
  });

  final double balance;
  final List<int> presetAmounts;
  final List<WalletTransactionItem> transactions;
  final List<WithdrawRequestItem> withdrawRequests;

  factory WalletOverview.fromJson(Map<String, dynamic> json) {
    return WalletOverview(
      balance: (json['balance'] as num?)?.toDouble() ?? 0,
      presetAmounts: (json['preset_amounts'] as List<dynamic>? ?? <dynamic>[])
          .whereType<num>()
          .map((value) => value.toInt())
          .toList(),
      transactions: (json['transactions'] as List<dynamic>? ?? <dynamic>[])
          .whereType<Map<String, dynamic>>()
          .map(WalletTransactionItem.fromJson)
          .toList(),
      withdrawRequests: (json['recent_withdraw_requests'] as List<dynamic>? ?? <dynamic>[])
          .whereType<Map<String, dynamic>>()
          .map(WithdrawRequestItem.fromJson)
          .toList(),
    );
  }
}

class WalletTransactionItem {
  const WalletTransactionItem({
    required this.id,
    required this.type,
    required this.amount,
    required this.description,
    required this.referenceType,
    required this.balanceAfter,
    required this.createdAt,
  });

  final int id;
  final String type;
  final double amount;
  final String description;
  final String? referenceType;
  final double balanceAfter;
  final DateTime? createdAt;

  bool get isCredit => type == 'credit';

  factory WalletTransactionItem.fromJson(Map<String, dynamic> json) {
    return WalletTransactionItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? 'debit',
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      description: json['description'] as String? ?? '-',
      referenceType: json['reference_type'] as String?,
      balanceAfter: (json['balance_after'] as num?)?.toDouble() ?? 0,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? ''),
    );
  }
}

class WithdrawRequestItem {
  const WithdrawRequestItem({
    required this.id,
    required this.requestNo,
    required this.amount,
    required this.status,
    required this.remarks,
    required this.createdAt,
  });

  final int id;
  final String requestNo;
  final double amount;
  final String status;
  final String? remarks;
  final DateTime? createdAt;

  factory WithdrawRequestItem.fromJson(Map<String, dynamic> json) {
    return WithdrawRequestItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      requestNo: json['request_no'] as String? ?? '-',
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      status: json['status'] as String? ?? 'pending',
      remarks: json['remarks'] as String?,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? ''),
    );
  }
}

class WalletTopupOrder {
  const WalletTopupOrder({
    required this.orderId,
    required this.amount,
    required this.currency,
    required this.keyId,
  });

  final String orderId;
  final int amount;
  final String currency;
  final String keyId;

  factory WalletTopupOrder.fromJson(Map<String, dynamic> json) {
    return WalletTopupOrder(
      orderId: json['order_id'] as String? ?? '',
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      currency: json['currency'] as String? ?? 'INR',
      keyId: json['key_id'] as String? ?? '',
    );
  }
}