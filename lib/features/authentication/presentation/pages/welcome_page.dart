import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/app_localizations.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../presentation/providers/auth_provider.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing24, vertical: AppTheme.spacing16),
          child: Column(
            children: [
              const Spacer(),
              
              // Premium branding Illustration Placeholder
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  gradient: AppTheme.premiumGradient,
                  shape: BoxShape.circle,
                  boxShadow: AppTheme.softShadow,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.radar_rounded,
                  color: context.colors.onPrimary,
                  size: 72,
                ),
              ),
              const SizedBox(height: AppTheme.spacing32),
              
              // Headline
              Text(
                context.translate('welcome_title'),
                textAlign: TextAlign.center,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: AppTheme.spacing12),
              
              // Short description
              Text(
                context.translate('welcome_desc'),
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onSurface.withOpacity(0.55),
                  height: 1.45,
                ),
              ),
              
              const Spacer(),
              
              // Primary CTA: Continue as Guest
              AppButton(
                text: context.translate('welcome_guest_btn'),
                style: AppButtonStyle.gradient,
                onPressed: () async {
                  final result = await ref.read(authNotifierProvider.notifier).loginAsGuest();
                  if (result.isSuccess && context.mounted) {
                    context.go('/dashboard');
                  }
                },
              ),
              const SizedBox(height: AppTheme.spacing16),
              
              // Secondary Buttons: Login / Sign Up
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: context.translate('login_btn'),
                      style: AppButtonStyle.outlined,
                      onPressed: () => context.push('/login'),
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacing12),
                  Expanded(
                    child: AppButton(
                      text: context.translate('welcome_signup_btn'),
                      style: AppButtonStyle.secondary,
                      onPressed: () => context.push('/register'),
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              // Privacy Policy and Terms
              Text(
                context.translate('welcome_terms'),
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.onSurface.withOpacity(0.4),
                  fontSize: 10,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: AppTheme.spacing16),
              
              // Version number
              Text(
                'v1.0.0 (BizSCAN Engine)',
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colors.onSurface.withOpacity(0.3),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
