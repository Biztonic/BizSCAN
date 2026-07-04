import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();

    // Emulate initial loading of app configuration and routing logic
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // Go to onboarding page (default navigation flow)
        context.go('/onboarding');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: AppTheme.spacing48),
              
              // App Logo & Branding Center
              Center(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo Box (Premium Glassmorphic/Technical aesthetic)
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: context.colors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(AppTheme.radiusExtraLarge),
                          border: Border.all(
                            color: context.colors.primary.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.radar_rounded, // Scanning theme
                          size: 56,
                          color: context.colors.primary,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacing24),
                      Text(
                        'BizSCAN',
                        style: context.textTheme.headlineLarge?.copyWith(
                          color: context.colors.onSurface,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacing8),
                      Text(
                        'AI-Powered OBD Diagnostics',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colors.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Loading Spinner & App Version Bottom
              Padding(
                padding: const EdgeInsets.only(bottom: AppTheme.spacing32),
                child: Column(
                  children: [
                    // Modern styled custom loading indicator
                    SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary),
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacing32),
                    Text(
                      'v1.0.0',
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colors.onSurface.withOpacity(0.4),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
