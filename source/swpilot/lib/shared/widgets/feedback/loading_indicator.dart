import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_colors.dart';

enum LoadingIndicatorType { circular, linear }

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.type = LoadingIndicatorType.circular,
    this.value,
  });

  final LoadingIndicatorType type;
  final double? value;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LoadingIndicatorType.circular:
        return Center(
          child: CircularProgressIndicator(
            value: value,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.cyan),
          ),
        );
      case LoadingIndicatorType.linear:
        return Center(
          child: LinearProgressIndicator(
            value: value,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.cyan),
            backgroundColor: AppColors.surface,
          ),
        );
    }
  }
}
