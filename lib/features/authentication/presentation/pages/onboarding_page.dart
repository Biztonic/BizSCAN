import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/services/di_service.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    try {
      final prefs = sl<SharedPreferences>();
      await prefs.setBool('show_onboarding', false);
    } catch (_) {
      // Navigation must proceed even if prefs fail
    }
    if (context.mounted) {
      context.go('/welcome');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Skip Button Top
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () => _completeOnboarding(context),
                  child: Text(
                    'Skip',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colors.primary,
                    ),
                  ),
                ),
              ),

              // Placeholder Onboarding Slide Content
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Vector/Illustration placeholder
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: context.colors.primary.withOpacity(0.05),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.insights_rounded,
                      size: 80,
                      color: context.colors.primary,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacing48),
                  Text(
                    'Complete Vehicle Health Scan',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacing16),
                  Text(
                    'Scan engine faults, read dynamic data streams, and diagnose your car health instantly using AI insights.',
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.onSurface.withOpacity(0.6),
                      height: 1.5,
                    ),
                  ),
                ],
              ),

              // Navigation Controls Bottom
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Page Indicators Placeholder
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        width: index == 0 ? 24 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: index == 0 ? context.colors.primary : context.colors.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacing32),
                  
                  // Primary Action Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => _completeOnboarding(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.primary,
                        foregroundColor: context.colors.onPrimary,
                        elevation: AppTheme.elevationNone,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colors.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
