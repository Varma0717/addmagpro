import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app_state.dart';
import '../../../core/network/api_client.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/models/auth_user.dart';
import '../data/profile_repository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.appState});

  final AppState appState;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final ProfileRepository _repository;
  bool _saving = false;
  String? _error;
  String? _pickedAvatarPath;

  @override
  void initState() {
    super.initState();
    final user = widget.appState.currentUser;
    _nameController = TextEditingController(text: user?.name ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _repository = ProfileRepository(apiClient: ApiClient());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _pickAvatar() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery, maxWidth: 512, maxHeight: 512, imageQuality: 80);
    if (image == null) return;
    setState(() => _pickedAvatarPath = image.path);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final token = widget.appState.token;
    if (token == null) return;

    setState(() { _saving = true; _error = null; });
    try {
      final AuthUser user = await _repository.updateProfile(
        token,
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        avatarPath: _pickedAvatarPath,
      );
      if (!mounted) return;
      widget.appState.replaceCurrentUser(user);
      setState(() => _pickedAvatarPath = null);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully'), behavior: SnackBarBehavior.floating, backgroundColor: AppColors.success),
      );
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error.toString());
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.appState.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Avatar section
          Center(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: _pickAvatar,
                  child: CircleAvatar(
                    radius: 52,
                    backgroundColor: AppColors.primaryLight,
                    backgroundImage: _pickedAvatarPath != null
                        ? FileImage(File(_pickedAvatarPath!))
                        : (user?.avatarUrl != null ? NetworkImage(user!.avatarUrl!) : null),
                    child: _pickedAvatarPath == null && user?.avatarUrl == null
                        ? Text(
                            (user?.name ?? 'U').trim().characters.first.toUpperCase(),
                            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: AppColors.primary),
                          )
                        : null,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _pickAvatar,
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.5),
                      ),
                      child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: _pickAvatar,
              child: const Text('Change Photo', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
            ),
          ),
          const SizedBox(height: 8),

          // Info cards
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Icon(Icons.person_outline_rounded, color: AppColors.primary, size: 22),
                      const SizedBox(height: 4),
                      Text(user?.role?.toUpperCase() ?? 'MEMBER', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: AppColors.primary)),
                      const Text('Role', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
                    ],
                  ),
                ),
                Container(width: 1, height: 40, color: AppColors.border),
                Expanded(
                  child: Column(
                    children: [
                      const Icon(Icons.account_balance_wallet_outlined, color: AppColors.success, size: 22),
                      const SizedBox(height: 4),
                      Text('₹${(user?.walletBalance ?? 0).toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: AppColors.success)),
                      const Text('Wallet', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
                    ],
                  ),
                ),
                Container(width: 1, height: 40, color: AppColors.border),
                Expanded(
                  child: Column(
                    children: [
                      const Icon(Icons.qr_code_rounded, color: AppColors.info, size: 22),
                      const SizedBox(height: 4),
                      Text(user?.referralCode ?? '-', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: AppColors.info)),
                      const Text('Referral', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          if (_error != null)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.error.withAlpha(15), borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  const Icon(Icons.error_outline, size: 18, color: AppColors.error),
                  const SizedBox(width: 8),
                  Expanded(child: Text(_error!, style: TextStyle(color: AppColors.error, fontSize: 13))),
                ],
              ),
            ),

          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Full name', prefixIcon: Icon(Icons.person_outline_rounded)),
                  validator: (value) => (value ?? '').trim().isEmpty ? 'Name is required' : null,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone number', prefixIcon: Icon(Icons.phone_outlined)),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 28),
                FilledButton(
                  onPressed: _saving ? null : _save,
                  style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
                  child: _saving
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : const Text('Save Profile'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}