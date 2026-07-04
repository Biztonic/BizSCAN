import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/config/app_localizations.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/app_controls.dart';
import '../../../../shared/dialogs/app_snackbar.dart';
import '../../presentation/providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      final result = await ref.read(authNotifierProvider.notifier).signInWithEmail(
        _emailController.text.trim(),
        _passwordController.text,
      );

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        if (result.isSuccess) {
          context.go('/dashboard');
        } else {
          final errorMsg = result.failureOrNull?.message ?? 'Login failed';
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
                    context.translate('login_title'),
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacing8),
                  Text(
                    context.translate('login_subtitle'),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.onSurface.withOpacity(0.55),
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacing32),

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

                  // Password
                  AppPasswordField(
                    controller: _passwordController,
                    label: context.translate('login_password'),
                    hint: '••••••••',
                    validator: Validators.validatePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: AppTheme.spacing12),

                  // Remember Me & Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppSwitch(
                            value: _rememberMe,
                            onChanged: _isLoading
                                ? null
                                : (val) {
                                    setState(() {
                                      _rememberMe = val;
                                    });
                                  },
                          ),
                          const SizedBox(width: AppTheme.spacing8),
                          Text(
                            context.translate('login_remember'),
                            style: context.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: _isLoading ? null : () => context.push('/forgot-password'),
                        child: Text(
                          context.translate('login_forgot'),
                          style: TextStyle(
                            color: context.colors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.spacing24),

                  // Sign In Button
                  AppButton(
                    text: context.translate('login_btn'),
                    style: AppButtonStyle.primary,
                    isLoading: _isLoading,
                    onPressed: _handleLogin,
                  ),
                  const SizedBox(height: AppTheme.spacing24),

                  // Divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: context.colors.outline.withOpacity(0.3))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing16),
                        child: Text(
                          'OR',
                          style: context.textTheme.labelSmall?.copyWith(
                            color: context.colors.onSurface.withOpacity(0.4),
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: context.colors.outline.withOpacity(0.3))),
                    ],
                  ),
                  const SizedBox(height: AppTheme.spacing24),

                  // Google and Phone login helpers
                  AppButton(
                    text: context.translate('login_google'),
                    style: AppButtonStyle.outlined,
                    onPressed: _isLoading
                        ? null
                        : () async {
                            setState(() => _isLoading = true);
                            final result = await ref.read(authNotifierProvider.notifier).repository.loginWithGoogle();
                            setState(() => _isLoading = false);
                            if (result.isSuccess && context.mounted) {
                              context.go('/dashboard');
                            } else if (context.mounted) {
                              AppSnackbar.showError(context, result.failureOrNull?.message ?? 'Google login cancelled');
                            }
                          },
                  ),
                  const SizedBox(height: AppTheme.spacing12),
                  
                  AppButton(
                    text: context.translate('login_phone'),
                    style: AppButtonStyle.outlined,
                    onPressed: _isLoading ? null : () => context.push('/phone-login'),
                  ),
                  const SizedBox(height: AppTheme.spacing32),

                  // Route to Register
                  Center(
                    child: TextButton(
                      onPressed: _isLoading ? null : () => context.push('/register'),
                      child: Text(
                        context.translate('login_no_account'),
                        style: TextStyle(
                          color: context.colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
