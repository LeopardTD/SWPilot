import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swpilot/features/splash/presentation/pages/splash_page.dart';
import 'package:swpilot/features/dashboard/presentation/pages/dashboard_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardPage();
      },
    ),
  ],
);
