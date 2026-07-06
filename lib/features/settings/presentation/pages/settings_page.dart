import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/extensions/context_extensions.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppTheme.spacing16),
        children: [
          // Section: Preferences
          _sectionHeader(context, 'Preferences'),
          _settingsItem(
            context,
            icon: Icons.language_rounded,
            title: 'Language',
            subtitle: 'English / Hindi / Marathi',
            onTap: () {
              context.push('/language-selection');
            },
          ),
          _settingsItem(
            context,
            icon: Icons.dark_mode_rounded,
            title: 'Dark Theme',
            subtitle: 'System Default',
            onTap: () {},
          ),
          const SizedBox(height: AppTheme.spacing16),

          // Section: OBD Diagnostics Config
          _sectionHeader(context, 'Scanner Settings'),
          _settingsItem(
            context,
            icon: Icons.bluetooth_rounded,
            title: 'Device Connection',
            subtitle: 'Choose OBD-II Bluetooth device',
            onTap: () {
              context.push('/bluetooth-scan');
            },
          ),
          _settingsItem(
            context,
            icon: Icons.settings_remote_rounded,
            title: 'OBD-II Protocol',
            subtitle: 'Auto-Select Protocol',
            onTap: () {},
          ),
          const SizedBox(height: AppTheme.spacing16),

          // Section: About
          _sectionHeader(context, 'About'),
          _settingsItem(
            context,
            icon: Icons.info_outline_rounded,
            title: 'About BizSCAN',
            subtitle: 'v1.0.0 (Diagnostics Engine)',
            onTap: () {},
          ),
          const SizedBox(height: AppTheme.spacing16),

          // Section: Developer Tools
          _sectionHeader(context, 'Developer Tools'),
          _settingsItem(
            context,
            icon: Icons.developer_mode_rounded,
            title: 'Design Style Guide',
            subtitle: 'Inspect design tokens & component library',
            onTap: () {
              context.push('/style-guide');
            },
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppTheme.spacing12,
        bottom: AppTheme.spacing8,
      ),
      child: Text(
        title,
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colors.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _settingsItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacing12),
      child: ListTile(
        leading: Icon(icon, color: context.colors.primary),
        title: Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colors.onSurface.withOpacity(0.5),
          ),
        ),
        trailing: const Icon(Icons.chevron_right_rounded, size: 20),
        onTap: onTap,
      ),
    );
  }
}
