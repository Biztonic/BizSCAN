import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/extensions/context_extensions.dart';

class AppDialog {
  static Future<void> showAlert(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'OK',
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Text(message),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(confirmLabel, style: TextStyle(color: context.colors.primary)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<bool> showConfirm(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool isDestructive = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Text(message),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(cancelLabel, style: TextStyle(color: context.colors.onSurface.withOpacity(0.6))),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                confirmLabel,
                style: TextStyle(
                  color: isDestructive ? context.colors.error : context.colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }

  static void showLoading(BuildContext context, {required String message}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
            ),
            content: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppTheme.spacing16),
              child: Row(
                children: [
                  const CircularProgressIndicator(strokeWidth: 3),
                  const SizedBox(width: AppTheme.spacing24),
                  Expanded(
                    child: Text(
                      message,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
