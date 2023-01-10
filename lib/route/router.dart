import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/pages/root_page.dart';

import '../pages/welcome_page.dart';
import '../utils/user_secure_storage.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const TabPage(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (BuildContext context, GoRouterState state) =>
          const LandingPage(),
    ),
  ],
  redirect: (context, state) async {
    var token = await UserSecureStorage.getToken();
    if (token == null) {
      return '/welcome';
    }
    return null;
  },
);
