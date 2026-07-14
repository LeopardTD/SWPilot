import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_colors.dart';
import 'package:swpilot/shared/widgets/components/app_text.dart';

class VersionSection extends StatelessWidget {
  const VersionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppText(
      'v1.0.0',
      style: AppTextStyle.labelSmall,
      color: AppColors.white.withValues(alpha: 0.5),
    );
  }
}
