import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
    this.tooltip,
    this.color,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      tooltip: tooltip,
      color: color ?? AppColors.cyan,
      style: IconButton.styleFrom(shape: const CircleBorder()),
    );
  }
}
