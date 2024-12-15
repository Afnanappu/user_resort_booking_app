import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/feature/authentication/views/screens/screen_login.dart';
import 'package:user_resort_booking_app/feature/authentication/views/screens/screen_sign_up.dart';
import 'package:user_resort_booking_app/feature/onboarding/views/screens/screen_onboarding_2.dart';
import 'package:user_resort_booking_app/feature/onboarding/views/screens/screen_onboarding.dart';
import 'package:user_resort_booking_app/routes/custom_route_transition.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

final routes = GoRouter(
  initialLocation: '/',
  navigatorKey: _navigatorKey,
  observers: [
    MyNavigatorObserver(),
  ],
  routes: [
    GoRoute(
        name: 'onboarding',
        path: '/',
        pageBuilder: (context, state) =>
            customTransitionPage(state, ScreenOnboarding())),
    GoRoute(
      name: 'onboarding2',
      path: '/${AppRoutes.onboarding2}',
      pageBuilder: (context, state) =>
          customTransitionPage(state, ScreenOnboarding2()),
      routes: [
        GoRoute(
          name: 'login',
          path: AppRoutes.login,
          pageBuilder: (context, state) =>
              customTransitionPage(state, ScreenLogin()),
        ),
        GoRoute(
          name: 'signup',
          path: AppRoutes.signUp,
          pageBuilder: (context, state) =>
              customTransitionPage(state, ScreenSignUp()),
        ),
      ],
    ),
  ],
);

//This class is an observable class that will log every navigation changes. Put this class in an observer.
//Can customize out put of any navigation.
class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log('Push: =>');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log('Pop: <=');
  }
}
