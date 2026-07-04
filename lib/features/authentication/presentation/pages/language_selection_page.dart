import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/locale_provider.dart';
import '../../../../shared/widgets/app_button.dart';

class LanguageSelectionPage extends ConsumerStatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  ConsumerState<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends ConsumerState<LanguageSelectionPage> {
  String _selectedLang = 'en';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final activeLocale = ref.read(localeStateNotifierProvider);
      setState(() {
        _selectedLang = activeLocale.languageCode;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppTheme.spacing32),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(AppTheme.spacing16),
                  decoration: BoxDecoration(
                    color: context.colors.primary.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.translate_rounded,
                    color: context.colors.primary,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.spacing32),
              Center(
                child: Text(
                  'Select Language\nभाषा निवडा / भाषा चुनें',
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.spacing48),
              
              // English selection card
              _buildLangTile('en', 'English', 'Global standard'),
              const SizedBox(height: AppTheme.spacing12),
              // Hindi selection card
              _buildLangTile('hi', 'हिंदी (Hindi)', 'राष्ट्रीय भाषा'),
              const SizedBox(height: AppTheme.spacing12),
              // Marathi selection card
              _buildLangTile('mr', 'मराठी (Marathi)', 'प्रादेशिक भाषा'),
              
              const Spacer(),
              
              AppButton(
                text: 'Continue',
                style: AppButtonStyle.primary,
                onPressed: () async {
                  await ref.read(localeStateNotifierProvider.notifier).changeLocale(_selectedLang);
                  if (context.mounted) {
                    context.go('/welcome');
                  }
                },
              ),
              const SizedBox(height: AppTheme.spacing16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLangTile(String code, String name, String sub) {
    final bool isSelected = _selectedLang == code;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedLang = code;
        });
      },
      borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing20, vertical: AppTheme.spacing16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? context.colors.primary : context.colors.outline.withOpacity(0.3),
            width: isSelected ? AppTheme.borderMedium : AppTheme.borderThin,
          ),
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          color: isSelected ? context.colors.primary.withOpacity(0.04) : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  sub,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colors.onSurface.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            if (isSelected)
              Icon(Icons.check_circle_rounded, color: context.colors.primary)
            else
              Icon(Icons.circle_outlined, color: context.colors.onSurface.withOpacity(0.3)),
          ],
        ),
      ),
    );
  }
}
