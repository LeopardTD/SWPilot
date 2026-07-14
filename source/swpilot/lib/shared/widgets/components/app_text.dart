import 'package:flutter/material.dart';
import 'package:swpilot/theme/app_text_theme.dart';

enum AppTextStyle {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  terminalLarge,
  terminalMedium,
  terminalSmall,
}

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    required this.style,
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final AppTextStyle style;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    switch (style) {
      case AppTextStyle.displayLarge:
        textStyle = AppTextTheme.displayLarge;
        break;
      case AppTextStyle.displayMedium:
        textStyle = AppTextTheme.displayMedium;
        break;
      case AppTextStyle.displaySmall:
        textStyle = AppTextTheme.displaySmall;
        break;
      case AppTextStyle.headlineLarge:
        textStyle = AppTextTheme.headlineLarge;
        break;
      case AppTextStyle.headlineMedium:
        textStyle = AppTextTheme.headlineMedium;
        break;
      case AppTextStyle.headlineSmall:
        textStyle = AppTextTheme.headlineSmall;
        break;
      case AppTextStyle.titleLarge:
        textStyle = AppTextTheme.titleLarge;
        break;
      case AppTextStyle.titleMedium:
        textStyle = AppTextTheme.titleMedium;
        break;
      case AppTextStyle.titleSmall:
        textStyle = AppTextTheme.titleSmall;
        break;
      case AppTextStyle.bodyLarge:
        textStyle = AppTextTheme.bodyLarge;
        break;
      case AppTextStyle.bodyMedium:
        textStyle = AppTextTheme.bodyMedium;
        break;
      case AppTextStyle.bodySmall:
        textStyle = AppTextTheme.bodySmall;
        break;
      case AppTextStyle.labelLarge:
        textStyle = AppTextTheme.labelLarge;
        break;
      case AppTextStyle.labelMedium:
        textStyle = AppTextTheme.labelMedium;
        break;
      case AppTextStyle.labelSmall:
        textStyle = AppTextTheme.labelSmall;
        break;
      case AppTextStyle.terminalLarge:
        textStyle = AppTextTheme.terminalLarge;
        break;
      case AppTextStyle.terminalMedium:
        textStyle = AppTextTheme.terminalMedium;
        break;
      case AppTextStyle.terminalSmall:
        textStyle = AppTextTheme.terminalSmall;
        break;
    }

    if (color != null) {
      textStyle = textStyle.copyWith(color: color);
    }

    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
