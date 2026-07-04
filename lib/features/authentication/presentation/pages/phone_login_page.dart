import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/app_localizations.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/dialogs/app_snackbar.dart';
import '../providers/auth_provider.dart';

class PhoneLoginPage extends ConsumerStatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  ConsumerState<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends ConsumerState<PhoneLoginPage> {
  final _phoneController = TextEditingController();
  final _countryCodeController = TextEditingController(text: '+91');
  
  bool _otpSent = false;
  String? _verificationId;
  bool _isLoading = false;
  
  // Resend Timer parameters
  int _timerSeconds = 30;
  Timer? _resendTimer;
  bool _canResend = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _countryCodeController.dispose();
    _resendTimer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _timerSeconds = 30;
      _canResend = false;
    });
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds == 0) {
        setState(() {
          _canResend = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _timerSeconds--;
        });
      }
    });
  }

  Future<void> _sendOtp() async {
    final rawPhone = _phoneController.text.trim();
    if (rawPhone.isEmpty || rawPhone.length < 10) {
      AppSnackbar.showError(context, 'Please enter a valid 10-digit phone number');
      return;
    }

    final fullNumber = '${_countryCodeController.text.trim()}$rawPhone';
    setState(() {
      _isLoading = true;
    });

    final repo = ref.read(authNotifierProvider.notifier).repository;
    final result = await repo.loginWithPhone(
      phone: fullNumber,
      codeSent: (verificationId, resendToken) {
        if (mounted) {
          setState(() {
            _verificationId = verificationId;
            _otpSent = true;
            _isLoading = false;
          });
          _startTimer();
          AppSnackbar.showSuccess(context, 'OTP verification code sent!');
        }
      },
      verificationFailed: (e) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          AppSnackbar.showError(context, e.toString().replaceAll('Exception: ', ''));
        }
      },
    );

    if (result.isFailure && mounted) {
      setState(() {
        _isLoading = false;
      });
      AppSnackbar.showError(context, result.failureOrNull?.message ?? 'Failed to send OTP');
    }
  }

  Future<void> _verifyOtp(String code) async {
    if (_verificationId == null) {
      AppSnackbar.showError(context, 'Verification ID is missing. Send OTP again.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final repo = ref.read(authNotifierProvider.notifier).repository;
    final result = await repo.verifyOtp(
      verificationId: _verificationId!,
      smsCode: code,
    );

    if (mounted) {
      setState(() {
        _isLoading = false;
      });

      if (result.isSuccess) {
        context.go('/dashboard');
      } else {
        AppSnackbar.showError(context, result.failureOrNull?.message ?? 'Invalid OTP code');
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
          onPressed: () {
            if (_otpSent) {
              setState(() {
                _otpSent = false;
              });
            } else {
              context.pop();
            }
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppTheme.spacing20),
              Text(
                _otpSent ? context.translate('otp_title') : context.translate('phone_title'),
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppTheme.spacing8),
              Text(
                _otpSent ? context.translate('otp_subtitle') : context.translate('phone_subtitle'),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurface.withOpacity(0.55),
                ),
              ),
              const SizedBox(height: AppTheme.spacing32),

              if (!_otpSent) ...[
                // Phone Number input
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80,
                      child: AppTextField(
                        controller: _countryCodeController,
                        label: 'Code',
                        keyboardType: TextInputType.phone,
                        enabled: !_isLoading,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacing12),
                    Expanded(
                      child: AppTextField(
                        controller: _phoneController,
                        label: context.translate('phone_number'),
                        hint: '99999 99999',
                        prefix: const Icon(Icons.phone_outlined),
                        keyboardType: TextInputType.phone,
                        enabled: !_isLoading,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                AppButton(
                  text: context.translate('phone_send_otp'),
                  style: AppButtonStyle.primary,
                  isLoading: _isLoading,
                  onPressed: _sendOtp,
                ),
              ] else ...[
                // OTP code input
                Center(
                  child: AppOtpField(
                    length: 6,
                    onCompleted: _verifyOtp,
                  ),
                ),
                const SizedBox(height: AppTheme.spacing32),
                Center(
                  child: _canResend
                      ? TextButton(
                          onPressed: _isLoading ? null : _sendOtp,
                          child: Text(
                            context.translate('otp_resend'),
                            style: TextStyle(
                              color: context.colors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Text(
                          'Resend OTP in $_timerSeconds s',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.onSurface.withOpacity(0.4),
                          ),
                        ),
                ),
                const Spacer(),
              ],
              const SizedBox(height: AppTheme.spacing24),
            ],
          ),
        ),
      ),
    );
  }
}
