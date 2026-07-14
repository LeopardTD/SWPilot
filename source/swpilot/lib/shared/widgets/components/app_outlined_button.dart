import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_colors.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.isLoading = false,
    this.isDisabled = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final bool enabled = onPressed != null && !isLoading && !isDisabled;

    return OutlinedButton(
      onPressed: enabled ? onPressed : null,
      style: OutlinedButton.styleFrom(minimumSize: const Size(88.0, 48.0)),
      child: isLoading
          ? const SizedBox(
              width: 24.0,
              height: 24.0,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.cyan),
              ),
            )
          : Text(text),
    );
  }
}
