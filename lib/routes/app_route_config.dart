import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mero_weather/pages/help_screen.dart';
import 'package:mero_weather/pages/homepage.dart';
import 'package:mero_weather/pages/splash_screen.dart';
import 'package:mero_weather/routes/app_route_constant.dart';

class MeroAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.splashScreen,
        path: '/',
        pageBuilder: (context, state) =>
            const MaterialPage(child: SplashScreen()),
      ),
      GoRoute(
        name: MyAppRouteConstants.helpScreen,
        path: '/helpScreen',
        pageBuilder: (context, state) =>
            const MaterialPage(child: HelpScreen()),
      ),
      GoRoute(
        name: MyAppRouteConstants.homePage,
        path: '/homePage',
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
      ),
    ],
  );
}
