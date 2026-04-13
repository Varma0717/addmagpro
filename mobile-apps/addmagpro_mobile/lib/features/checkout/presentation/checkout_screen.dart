import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../app_state.dart';
import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../data/checkout_repository.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.token,
    required this.appState,
    this.couponId,
  });

  final String token;
  final AppState appState;
  final int? couponId;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late final CheckoutRepository _repository;
  late final Razorpay _razorpay;
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  bool _busy = false;
  bool _useWallet = false;
  String _paymentMethod = 'cod';

  @override
  void initState() {
    super.initState();
    _repository = CheckoutRepository(apiClient: ApiClient());
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

    final user = widget.appState.currentUser;
    _nameController = TextEditingController(text: user?.name ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
  }

  @override
  void dispose() {
    _razorpay.clear();
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Razorpay payment succeeded, place order with payment details
    setState(() => _busy = true);
    try {
      final result = await _repository.placeOrder(
        token: widget.token,
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        address: _addressController.text.trim(),
        city: _cityController.text.trim(),
        state: _stateController.text.trim(),
        pincode: _pincodeController.text.trim(),
        paymentMethod: 'razorpay',
        couponId: widget.couponId,
        useWallet: _useWallet,
        razorpayOrderId: response.orderId,
        razorpayPaymentId: response.paymentId,
        razorpaySignature: response.signature,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order ${result.orderNumber} placed successfully!'), behavior: SnackBarBehavior.floating, backgroundColor: AppColors.success),
      );
      Navigator.of(context).pop(true);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment failed: ${response.message ?? 'Unknown error'}'), backgroundColor: AppColors.error),
    );
    setState(() => _busy = false);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_paymentMethod == 'razorpay') {
      await _startRazorpayCheckout();
      return;
    }

    setState(() => _busy = true);
    try {
      final result = await _repository.placeOrder(
        token: widget.token,
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        address: _addressController.text.trim(),
        city: _cityController.text.trim(),
        state: _stateController.text.trim(),
        pincode: _pincodeController.text.trim(),
        paymentMethod: _paymentMethod,
        couponId: widget.couponId,
        useWallet: _useWallet,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order ${result.orderNumber} placed successfully!'), behavior: SnackBarBehavior.floating, backgroundColor: AppColors.success),
      );
      Navigator.of(context).pop(true);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _startRazorpayCheckout() async {
    setState(() => _busy = true);
    try {
      final order = await _repository.createRazorpayOrder(
        token: widget.token,
        couponId: widget.couponId,
        useWallet: _useWallet,
      );

      final user = widget.appState.currentUser;
      final options = <String, dynamic>{
        'key': order.keyId,
        'amount': order.amount,
        'currency': order.currency,
        'order_id': order.orderId,
        'name': 'AddMagPro',
        'description': 'Order Payment',
        'prefill': {
          'name': _nameController.text.trim(),
          'contact': _phoneController.text.trim(),
          'email': user?.email ?? '',
        },
        'theme': {'color': '#FF7F11'},
      };

      _razorpay.open(options);
    } catch (error) {
      if (!mounted) return;
      setState(() => _busy = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Shipping info header
            const Row(
              children: [
                Icon(Icons.local_shipping_outlined, color: AppColors.primary, size: 20),
                SizedBox(width: 8),
                Text('Shipping Address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
              ],
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Full name', prefixIcon: Icon(Icons.person_outline_rounded)),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Name is required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone number', prefixIcon: Icon(Icons.phone_outlined)),
              keyboardType: TextInputType.phone,
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Phone is required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address', prefixIcon: Icon(Icons.location_on_outlined)),
              minLines: 2,
              maxLines: 3,
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Address is required' : null,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _cityController,
                    decoration: const InputDecoration(labelText: 'City'),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _stateController,
                    decoration: const InputDecoration(labelText: 'State'),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _pincodeController,
              decoration: const InputDecoration(labelText: 'Pincode', prefixIcon: Icon(Icons.pin_drop_outlined)),
              keyboardType: TextInputType.number,
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Pincode is required' : null,
            ),
            const SizedBox(height: 24),

            // Payment method
            const Row(
              children: [
                Icon(Icons.payment_rounded, color: AppColors.primary, size: 20),
                SizedBox(width: 8),
                Text('Payment Method', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
              ],
            ),
            const SizedBox(height: 14),
            _PaymentOption(value: 'cod', groupValue: _paymentMethod, label: 'Cash on Delivery', icon: Icons.local_shipping_rounded, onChanged: (v) => setState(() => _paymentMethod = v!)),
            _PaymentOption(value: 'razorpay', groupValue: _paymentMethod, label: 'Pay Online (Razorpay)', icon: Icons.credit_card_rounded, onChanged: (v) => setState(() => _paymentMethod = v!)),
            _PaymentOption(value: 'wallet', groupValue: _paymentMethod, label: 'Wallet Balance', icon: Icons.account_balance_wallet_rounded, onChanged: (v) => setState(() => _paymentMethod = v!)),

            if (_paymentMethod != 'wallet') ...[
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SwitchListTile.adaptive(
                  value: _useWallet,
                  onChanged: (value) => setState(() => _useWallet = value),
                  title: const Text('Also use wallet balance', style: TextStyle(fontSize: 14)),
                  activeColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],

            const SizedBox(height: 24),
            FilledButton(
              onPressed: _busy ? null : _submit,
              style: FilledButton.styleFrom(minimumSize: const Size(double.infinity, 52)),
              child: _busy
                  ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : Text(_paymentMethod == 'razorpay' ? 'Pay Now' : 'Place Order'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _PaymentOption extends StatelessWidget {
  const _PaymentOption({required this.value, required this.groupValue, required this.label, required this.icon, required this.onChanged});
  final String value;
  final String groupValue;
  final String label;
  final IconData icon;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final selected = value == groupValue;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryLight : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: selected ? AppColors.primary : AppColors.border, width: selected ? 1.5 : 0.5),
      ),
      child: RadioListTile<String>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Row(children: [Icon(icon, size: 20, color: selected ? AppColors.primary : AppColors.textMuted), const SizedBox(width: 10), Text(label, style: TextStyle(fontWeight: FontWeight.w600, color: selected ? AppColors.primary : AppColors.textPrimary))]),
        activeColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
