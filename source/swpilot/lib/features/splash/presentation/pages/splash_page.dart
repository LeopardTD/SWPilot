import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swpilot/features/splash/presentation/widgets/logo_section.dart';
import 'package:swpilot/features/splash/presentation/widgets/tagline_section.dart';
import 'package:swpilot/features/splash/presentation/widgets/version_section.dart';
import 'package:swpilot/shared/widgets/feedback/loading_indicator.dart';
import 'package:swpilot/shared/widgets/layout/app_scaffold.dart';
import 'package:swpilot/theme/app_spacing.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    _navigationTimer = Timer(const Duration(milliseconds: 2500), () {
      if (mounted) {
        context.go('/dashboard');
      }
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      useSafeArea: true,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              ),
            );
          },
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              LogoSection(),
              SizedBox(height: AppSpacing.xxl),
              TaglineSection(),
              Spacer(),
              SizedBox(
                width: 48.0,
                height: 48.0,
                child: LoadingIndicator(type: LoadingIndicatorType.circular),
              ),
              SizedBox(height: AppSpacing.xxl),
              VersionSection(),
              SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}
