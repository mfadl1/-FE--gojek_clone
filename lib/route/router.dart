import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';
import '../pages/welcome_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const MyHomePage(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (BuildContext context, GoRouterState state) =>
          const LandingPage(),
    ),
  ],
  redirect: (context, state) async {
    const isAuthenticated = true;
    // ignore: dead_code
    if (!isAuthenticated) {
      return '/welcome';
    }
    return null;
  },
);
