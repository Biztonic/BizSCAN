import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/config/app_localizations.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/dialogs/app_snackbar.dart';
import '../../presentation/providers/auth_provider.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_passwordController.text != _confirmPasswordController.text) {
        AppSnackbar.showError(context, 'Passwords do not match');
        return;
      }

      setState(() {
        _isLoading = true;
      });

      final result = await ref.read(authNotifierProvider.notifier).signUpWithEmail(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        phone: _phoneController.text.trim().isNotEmpty ? _phoneController.text.trim() : null,
      );

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        if (result.isSuccess) {
          context.go('/dashboard');
        } else {
          final errorMsg = result.failureOrNull?.message ?? 'Registration failed';
          AppSnackbar.showError(context, errorMsg);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.translate('signup_title'),
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacing8),
                  Text(
                    context.translate('signup_subtitle'),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.onSurface.withOpacity(0.55),
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacing32),

                  // Name
                  AppTextField(
                    controller: _nameController,
                    label: context.translate('signup_name'),
                    hint: 'Rohan Sharma',
                    prefix: const Icon(Icons.person_outline_rounded),
                    validator: (val) => val == null || val.trim().isEmpty ? 'Name is required' : null,
                    enabled: !_isLoading,
                  ),
                  const SizedBox(height: AppTheme.spacing20),

                  // Email
                  AppTextField(
                    controller: _emailController,
                    label: context.translate('login_email'),
                    hint: 'name@domain.com',
                    prefix: const Icon(Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                    enabled: !_isLoading,
                  ),
                  const SizedBox(height: AppTheme.spacing20),

                  // Phone
                  AppTextField(
                    controller: _phoneController,
                    label: context.translate('signup_phone'),
                    hint: '+91 99999 99999',
                    prefix: const Icon(Icons.phone_outlined),
                    keyboardType: TextInputType.phone,
                    enabled: !_isLoading,
                  ),
                  const SizedBox(height: AppTheme.spacing20),

                  // Password
                  AppPasswordField(
                    controller: _passwordController,
                    label: context.translate('login_password'),
                    hint: '••••••••',
                    validator: Validators.validatePassword,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: AppTheme.spacing20),

                  // Confirm Password
                  AppPasswordField(
                    controller: _confirmPasswordController,
                    label: context.translate('signup_confirm_password'),
                    hint: '••••••••',
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Confirm password is required';
                      }
                      if (val != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: AppTheme.spacing32),

                  // Create Account Button
                  AppButton(
                    text: context.translate('signup_btn'),
                    style: AppButtonStyle.primary,
                    isLoading: _isLoading,
                    onPressed: _handleRegister,
                  ),
                  const SizedBox(height: AppTheme.spacing32),

                  // Route back to Login
                  Center(
                    child: TextButton(
                      onPressed: _isLoading ? null : () => context.pop(),
                      child: Text(
                        context.translate('signup_has_account'),
                        style: TextStyle(
                          color: context.colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacing16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
