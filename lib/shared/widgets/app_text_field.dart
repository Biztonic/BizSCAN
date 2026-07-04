import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool enabled;

  const AppTextField({
    super.key,
    this.controller,
    required this.label,
    this.hint,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.colors.onSurface.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: AppTheme.spacing8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          enabled: enabled,
          style: context.textTheme.bodyMedium?.copyWith(
            color: enabled ? context.colors.onSurface : context.colors.onSurface.withOpacity(AppTheme.opacityDisabled),
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface.withOpacity(0.4),
            ),
            prefixIcon: prefix,
            suffixIcon: suffix,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacing16,
              vertical: AppTheme.spacing16,
            ),
            filled: true,
            fillColor: enabled ? context.colors.surface : context.colors.outline.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              borderSide: BorderSide(
                color: context.colors.outline.withOpacity(0.2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              borderSide: BorderSide(
                color: context.colors.outline.withOpacity(0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              borderSide: BorderSide(
                color: context.colors.primary,
                width: AppTheme.borderMedium,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              borderSide: BorderSide(
                color: context.colors.error,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              borderSide: BorderSide(
                color: context.colors.error,
                width: AppTheme.borderMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onClear;

  const AppSearchField({
    super.key,
    this.controller,
    this.hint = 'Search...',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(Icons.search_rounded, color: context.colors.onSurface.withOpacity(0.5)),
        suffixIcon: controller != null && controller!.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear_rounded),
                onPressed: () {
                  controller!.clear();
                  if (onClear != null) onClear!();
                },
              )
            : null,
        filled: true,
        fillColor: context.colors.surface,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusFull),
          borderSide: BorderSide(color: context.colors.outline.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusFull),
          borderSide: BorderSide(color: context.colors.outline.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusFull),
          borderSide: BorderSide(color: context.colors.primary, width: AppTheme.borderMedium),
        ),
      ),
    );
  }
}

class AppPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String? hint;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;

  const AppPasswordField({
    super.key,
    this.controller,
    required this.label,
    this.hint,
    this.validator,
    this.textInputAction = TextInputAction.done,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      label: widget.label,
      hint: widget.hint,
      obscureText: _obscureText,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      prefix: const Icon(Icons.lock_outlined),
      suffix: IconButton(
        icon: Icon(_obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}

class AppOtpField extends StatefulWidget {
  final int length;
  final void Function(String)? onCompleted;

  const AppOtpField({
    super.key,
    this.length = 4,
    this.onCompleted,
  });

  @override
  State<AppOtpField> createState() => _AppOtpFieldState();
}

class _AppOtpFieldState extends State<AppOtpField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        if (widget.onCompleted != null) {
          final otp = _controllers.map((c) => c.text).join();
          widget.onCompleted!(otp);
        }
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) => SizedBox(
          width: 56,
          height: 56,
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            onChanged: (val) => _onChanged(val, index),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: context.colors.surface,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                borderSide: BorderSide(color: context.colors.outline.withOpacity(0.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                borderSide: BorderSide(color: context.colors.outline.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                borderSide: BorderSide(color: context.colors.primary, width: AppTheme.borderMedium),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
