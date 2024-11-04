import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/bottom_nav/presentation/navbar.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const NaviBar();
      },
    ),
    // GoRoute(
    //   path: '/onboard',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const OnboardPage();
    //   },
    // ),
    // GoRoute(
    //   path: '/login',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const LoginPage();
    //   },
    // ),
    // GoRoute(
    //   path: '/register',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const RegisterMailPage();
    //   },
    // ),
    // GoRoute(
    //   path: '/passcode',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const EnterPinPage();
    //   },
    // ),
    // GoRoute(
    //   path: '/bottomNav',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const NaviBar();
    //   },
    // ),
    // GoRoute(
    //   path: '/pinSetup',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const LoginSetupPinPage();
    //   },
    // ),
  ],
);
