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
import '../providers/auth_provider.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isSuccess = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleReset() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      final repo = ref.read(authNotifierProvider.notifier).repository;
      final result = await repo.resetPassword(_emailController.text.trim());

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        if (result.isSuccess) {
          setState(() {
            _isSuccess = true;
          });
        } else {
          final errorMsg = result.failureOrNull?.message ?? 'Failed to send reset link';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing24),
          child: _isSuccess ? _buildSuccessView() : _buildRequestView(),
        ),
      ),
    );
  }

  Widget _buildRequestView() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppTheme.spacing20),
          Text(
            context.translate('forgot_title'),
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppTheme.spacing8),
          Text(
            context.translate('forgot_subtitle'),
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface.withOpacity(0.55),
            ),
          ),
          const SizedBox(height: AppTheme.spacing32),

          AppTextField(
            controller: _emailController,
            label: context.translate('login_email'),
            hint: 'name@domain.com',
            prefix: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: Validators.validateEmail,
            enabled: !_isLoading,
          ),
          
          const Spacer(),
          
          AppButton(
            text: context.translate('forgot_btn'),
            style: AppButtonStyle.primary,
            isLoading: _isLoading,
            onPressed: _handleReset,
          ),
          const SizedBox(height: AppTheme.spacing24),
        ],
      ),
    );
  }

  Widget _buildSuccessView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(AppTheme.spacing24),
          decoration: BoxDecoration(
            color: AppTheme.successColor.withOpacity(0.08),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.mark_email_read_rounded,
            color: AppTheme.successColor,
            size: 64,
          ),
        ),
        const SizedBox(height: AppTheme.spacing32),
        Text(
          context.translate('forgot_success_title'),
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppTheme.spacing12),
        Text(
          context.translate('forgot_success_desc'),
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.onSurface.withOpacity(0.6),
            height: 1.45,
          ),
        ),
        const Spacer(),
        AppButton(
          text: 'Back to Sign In',
          style: AppButtonStyle.primary,
          onPressed: () => context.pop(),
        ),
        const SizedBox(height: AppTheme.spacing24),
      ],
    );
  }
}
