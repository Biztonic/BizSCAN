import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/app_dropdown.dart';
import '../../../../shared/widgets/app_segment_control.dart';
import '../../../../shared/widgets/app_chip_badge.dart';
import '../../../../shared/widgets/app_controls.dart';
import '../../../../shared/widgets/app_loaders.dart';
import '../../../../shared/widgets/app_tooltip.dart';
import '../../../../shared/widgets/app_card_system.dart';
import '../../../../shared/widgets/app_list_tiles.dart';
import '../../../../shared/widgets/app_empty_states.dart';
import '../../../../shared/dialogs/app_dialog.dart';
import '../../../../shared/dialogs/app_snackbar.dart';

class StyleGuidePage extends StatefulWidget {
  const StyleGuidePage({super.key});

  @override
  State<StyleGuidePage> createState() => _StyleGuidePageState();
}

class _StyleGuidePageState extends State<StyleGuidePage> {
  bool _isDarkOverride = false;
  String _selectedSegment = 'A';
  bool _switchVal = true;
  bool _checkboxVal = false;
  String _radioVal = 'Yes';
  double _sliderVal = 0.5;
  String? _dropdownVal = 'One';

  @override
  Widget build(BuildContext context) {
    final bool useDarkTheme = _isDarkOverride;

    final themeData = useDarkTheme ? AppTheme.darkTheme : AppTheme.lightTheme;

    return Theme(
      data: themeData,
      child: Scaffold(
        backgroundColor: themeData.colorScheme.surface,
        appBar: AppBar(
          title: const Text('Developer Style Guide', style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: Icon(useDarkTheme ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
              onPressed: () {
                setState(() {
                  _isDarkOverride = !_isDarkOverride;
                });
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.spacing16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Typography Scale
              _sectionTitle(themeData, '1. Typography Scale'),
              _typeScaleItem(themeData, 'Display Large', themeData.textTheme.displayLarge),
              _typeScaleItem(themeData, 'Headline Large', themeData.textTheme.headlineLarge),
              _typeScaleItem(themeData, 'Title Large', themeData.textTheme.titleLarge),
              _typeScaleItem(themeData, 'Body Large', themeData.textTheme.bodyLarge),
              _typeScaleItem(themeData, 'Label Large (Bold)', themeData.textTheme.labelLarge),
              _typeScaleItem(themeData, 'Body Small', themeData.textTheme.bodySmall),
              const SizedBox(height: AppTheme.spacing24),

              // Color System
              _sectionTitle(themeData, '2. Color Swatches'),
              Wrap(
                spacing: AppTheme.spacing8,
                runSpacing: AppTheme.spacing8,
                children: [
                  _colorBlock('Primary', themeData.colorScheme.primary, themeData.colorScheme.onPrimary),
                  _colorBlock('Secondary', themeData.colorScheme.secondary, themeData.colorScheme.onSecondary),
                  _colorBlock('Success', AppTheme.successColor, Colors.white),
                  _colorBlock('Warning', AppTheme.tertiaryColor, Colors.black),
                  _colorBlock('Error', AppTheme.errorColor, Colors.white),
                  _colorBlock('Excellent', AppTheme.healthExcellent, Colors.white),
                  _colorBlock('Good', AppTheme.healthGood, Colors.black),
                  _colorBlock('Warning H', AppTheme.healthWarning, Colors.white),
                  _colorBlock('Critical H', AppTheme.healthCritical, Colors.white),
                ],
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Buttons
              _sectionTitle(themeData, '3. Button Styles'),
              AppButton(
                text: 'Primary Action Button',
                style: AppButtonStyle.primary,
                onPressed: () {},
              ),
              const SizedBox(height: AppTheme.spacing12),
              AppButton(
                text: 'Secondary Action Button',
                style: AppButtonStyle.secondary,
                onPressed: () {},
              ),
              const SizedBox(height: AppTheme.spacing12),
              AppButton(
                text: 'Gradient Neon Button',
                style: AppButtonStyle.gradient,
                onPressed: () {},
              ),
              const SizedBox(height: AppTheme.spacing12),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: 'Outlined',
                      style: AppButtonStyle.outlined,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacing12),
                  Expanded(
                    child: AppButton(
                      text: 'Loading...',
                      style: AppButtonStyle.primary,
                      isLoading: true,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacing12),
              Row(
                children: [
                  AppIconButton(icon: Icons.bluetooth_rounded, onPressed: () {}),
                  const SizedBox(width: AppTheme.spacing12),
                  AppIconButton(icon: Icons.flash_on_rounded, iconColor: AppTheme.tertiaryColor, onPressed: () {}),
                ],
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Input Fields
              _sectionTitle(themeData, '4. Input Forms'),
              const AppTextField(
                label: 'Standard Input',
                hint: 'Enter parameter value',
              ),
              const SizedBox(height: AppTheme.spacing16),
              const AppPasswordField(
                label: 'Password Secure Input',
                hint: 'Enter account password',
              ),
              const SizedBox(height: AppTheme.spacing16),
              const Text('Search Input', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: AppTheme.spacing8),
              const AppSearchField(hint: 'Search DTC codes...'),
              const SizedBox(height: AppTheme.spacing16),
              const Text('OTP Grid Code', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: AppTheme.spacing8),
              const AppOtpField(),
              const SizedBox(height: AppTheme.spacing24),

              // Dropdowns & Selects
              _sectionTitle(themeData, '5. Dropdowns & Segment Controls'),
              AppDropdown<String>(
                label: 'Option Selection Dropdown',
                value: _dropdownVal,
                items: const [
                  DropdownMenuItem(value: 'One', child: Text('Option One')),
                  DropdownMenuItem(value: 'Two', child: Text('Option Two')),
                ],
                onChanged: (val) {
                  setState(() {
                    _dropdownVal = val;
                  });
                },
              ),
              const SizedBox(height: AppTheme.spacing16),
              const Text('Segment Switcher Slider', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: AppTheme.spacing8),
              AppSegmentControl<String>(
                segments: const ['A', 'B', 'C'],
                selectedSegment: _selectedSegment,
                labelBuilder: (s) => 'Segment $s',
                onSegmentSelected: (s) {
                  setState(() {
                    _selectedSegment = s;
                  });
                },
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Badges & Chips
              _sectionTitle(themeData, '6. Badges & Chips'),
              const Wrap(
                spacing: AppTheme.spacing8,
                runSpacing: AppTheme.spacing8,
                children: [
                  AppBadge(label: 'Excellent', style: BadgeStyle.success),
                  AppBadge(label: 'DTC Warning', style: BadgeStyle.warning),
                  AppBadge(label: 'Link Offline', style: BadgeStyle.error),
                  AppBadge(label: 'WiFi Info', style: BadgeStyle.info),
                ],
              ),
              const SizedBox(height: AppTheme.spacing12),
              Row(
                children: [
                  AppChip(label: 'Bluetooth', icon: Icons.bluetooth_rounded, isSelected: true, onSelected: (_) {}),
                  const SizedBox(width: AppTheme.spacing12),
                  AppChip(label: 'WiFi Status', icon: Icons.wifi_rounded, isSelected: false, onSelected: (_) {}),
                ],
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Controls
              _sectionTitle(themeData, '7. Selectors & Sliders'),
              Row(
                children: [
                  AppSwitch(value: _switchVal, onChanged: (v) => setState(() => _switchVal = v)),
                  const SizedBox(width: AppTheme.spacing24),
                  AppCheckbox(value: _checkboxVal, label: 'Agree to terms', onChanged: (v) => setState(() => _checkboxVal = v ?? false)),
                ],
              ),
              const SizedBox(height: AppTheme.spacing12),
              Row(
                children: [
                  AppRadio<String>(value: 'Yes', groupValue: _radioVal, label: 'Yes', onChanged: (v) => setState(() => _radioVal = v ?? '')),
                  AppRadio<String>(value: 'No', groupValue: _radioVal, label: 'No', onChanged: (v) => setState(() => _radioVal = v ?? '')),
                ],
              ),
              const SizedBox(height: AppTheme.spacing12),
              const Text('Control range slider', style: TextStyle(fontWeight: FontWeight.bold)),
              AppSlider(value: _sliderVal, onChanged: (v) => setState(() => _sliderVal = v)),
              const SizedBox(height: AppTheme.spacing24),

              // Loaders & Tooltips
              _sectionTitle(themeData, '8. Loaders & Tooltips'),
              const Row(
                children: [
                  AppCircularLoader(size: 24),
                  SizedBox(width: AppTheme.spacing24),
                  Expanded(child: AppLinearLoader(value: 0.7)),
                ],
              ),
              const SizedBox(height: AppTheme.spacing16),
              const Text('Skeleton Shimmer Cards', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: AppTheme.spacing8),
              const Row(
                children: [
                  AppShimmer(width: 80, height: 80),
                  SizedBox(width: AppTheme.spacing16),
                  Expanded(
                    child: Column(
                      children: [
                        AppShimmer(width: double.infinity, height: 16),
                        SizedBox(height: AppTheme.spacing8),
                        AppShimmer(width: double.infinity, height: 16),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacing16),
              AppTooltip(
                message: 'This is a premium design tooltip description helper.',
                child: Container(
                  padding: const EdgeInsets.all(AppTheme.spacing12),
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                  ),
                  child: const Text('Tap here to view Tooltip'),
                ),
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Cards
              _sectionTitle(themeData, '9. Automotive Cards'),
              const AppVehicleCard(
                makeModel: 'Maruti Swift (MOCK)',
                vin: 'MBH1234567890123',
                protocol: 'ISO 15765-4 (CAN 11/500)',
                isConnected: true,
              ),
              const SizedBox(height: AppTheme.spacing12),
              const AppHealthCard(
                score: 95,
                status: 'Excellent Health',
                description: 'AI Diagnostics: O2 sensors, coolant systems, and transmission parameters are fully optimal.',
              ),
              const SizedBox(height: AppTheme.spacing12),
              const Row(
                children: [
                  Expanded(
                    child: AppMetricCard(
                      label: 'Odometer',
                      value: '12,543',
                      unit: 'KM',
                      icon: Icons.speed_rounded,
                      activeColor: AppTheme.speedColor,
                    ),
                  ),
                  SizedBox(width: AppTheme.spacing12),
                  Expanded(
                    child: AppMetricCard(
                      label: 'Coolant',
                      value: '92',
                      unit: '°C',
                      icon: Icons.thermostat_rounded,
                      activeColor: AppTheme.temperatureColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacing12),
              AppGlassCard(
                child: Text(
                  'Translucent Glassmorphic backplate overlay container.',
                  style: themeData.textTheme.bodyMedium?.copyWith(
                    color: useDarkTheme ? Colors.white70 : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.spacing12),
              AppGradientCard(
                child: Text(
                  'Premium Navy/Slate Background Gradient Card layout.',
                  style: themeData.textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: AppTheme.spacing12),
              AppRecommendationCard(
                title: 'High Idle Speed Warning',
                description: 'Engine idle rotation exceeded 1050 RPM during warm-up. Check throttle position control sensor.',
                actionLabel: 'Check Sensor Status',
                isHighPriority: true,
                onTap: () {},
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Dialogs & Snackbars
              _sectionTitle(themeData, '10. Dialog Overlays & Toasts'),
              AppButton(
                text: 'Show Confirmation Dialog',
                style: AppButtonStyle.outlined,
                onPressed: () {
                  AppDialog.showConfirm(
                    context,
                    title: 'Clear Fault Codes?',
                    message: 'This will reset your engine warning lamps (MIL) and delete diagnostic freeze frame parameters.',
                    confirmLabel: 'Clear Code',
                    isDestructive: true,
                  );
                },
              ),
              const SizedBox(height: AppTheme.spacing12),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: 'Success SnackBar',
                      style: AppButtonStyle.outlined,
                      onPressed: () => AppSnackbar.showSuccess(context, 'DTC troubleshooting database updated!'),
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacing12),
                  Expanded(
                    child: AppButton(
                      text: 'Error SnackBar',
                      style: AppButtonStyle.outlined,
                      onPressed: () => AppSnackbar.showError(context, 'Bluetooth pairing sync timed out.'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Empty States Showcase
              _sectionTitle(themeData, '11. Empty States Showcase'),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: themeData.colorScheme.outline.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                ),
                child: AppEmptyState.noInternet(onRetryPressed: () {}),
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Reusable List Tiles
              _sectionTitle(themeData, '12. Reusable List Tiles'),
              AppSettingsTile(
                icon: Icons.language_rounded,
                title: 'Language setting',
                subtitle: 'English / Hindi / Marathi',
                onTap: () {},
              ),
              AppHistoryTile(
                vehicleName: 'Maruti Swift VXI (Mock)',
                date: '04 July 2026',
                dtcCount: 1,
                score: 78,
                onTap: () {},
              ),
              AppVehicleTile(
                model: 'Maruti Swift VXI',
                vin: 'MA3FDE51S00192X4',
                isSelected: true,
                onTap: () {},
              ),
              AppReportTile(
                faultCode: 'P0113',
                description: 'Intake Air Temperature Sensor Circuit High',
                category: 'Powertrain Control System',
                isCleared: false,
                onTap: () {},
              ),
              AppBluetoothDeviceTile(
                name: 'OBDII ELM327',
                address: '00:11:22:33:FF:EE',
                rssi: -65,
                isConnected: false,
                onTap: () {},
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(ThemeData theme, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacing16, top: AppTheme.spacing8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _typeScaleItem(ThemeData theme, String name, TextStyle? style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.5))),
          Text('Aa', style: style),
        ],
      ),
    );
  }

  Widget _colorBlock(String label, Color color, Color textColor) {
    return Container(
      width: 100,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        border: Border.all(color: Colors.black12),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
