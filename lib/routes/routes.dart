import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/navigation/view/screen_navigation.dart';
import 'package:user_resort_booking_app/feature/authentication/views/screens/screen_login.dart';
import 'package:user_resort_booking_app/feature/authentication/views/screens/screen_sign_up.dart';
import 'package:user_resort_booking_app/feature/home/views/screens/screen_home.dart';
import 'package:user_resort_booking_app/feature/home/views/screens/screen_home_property_details_.dart';
import 'package:user_resort_booking_app/feature/home/views/screens/screen_home_property_room_list.dart';
import 'package:user_resort_booking_app/feature/onboarding/views/screens/screen_onboarding_2.dart';
import 'package:user_resort_booking_app/feature/onboarding/views/screens/screen_onboarding.dart';
import 'package:user_resort_booking_app/feature/onboarding/views/screens/screen_splash.dart';
import 'package:user_resort_booking_app/feature/profile/view/screens/screen_profile.dart';
import 'package:user_resort_booking_app/feature/search/view/screens/screen_search.dart';
import 'package:user_resort_booking_app/routes/custom_route_transition.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final routes = GoRouter(
  initialLocation: '/${AppRoutes.home}',
  navigatorKey: _rootNavigatorKey,
  observers: [
    MyNavigatorObserver(),
  ],
  routes: [
    GoRoute(
      name: 'splash',
      path: '/${AppRoutes.splash}',
      pageBuilder: (context, state) {
        return customTransitionPage(state, ScreenSplash());
      },
    ),
    GoRoute(
        name: 'onboarding',
        path: '/${AppRoutes.onboarding}',
        pageBuilder: (context, state) =>
            customTransitionPage(state, ScreenOnboarding())),
    GoRoute(
      name: 'onboarding2',
      path: '/${AppRoutes.onboarding2}',
      pageBuilder: (context, state) =>
          customTransitionPage(state, ScreenOnboarding2()),
    ),
    GoRoute(
      name: 'login',
      path: '/${AppRoutes.login}',
      pageBuilder: (context, state) =>
          customTransitionPage(state, ScreenLogin()),
    ),
    GoRoute(
      name: 'signup',
      path: '/${AppRoutes.signUp}',
      pageBuilder: (context, state) =>
          customTransitionPage(state, ScreenSignUp()),
    ),
    GoRoute(
      path: '/${AppRoutes.propertyDetailsHome}',
      pageBuilder: (context, state) =>
          customTransitionPage(state, ScreenHomePropertyDetails()),
    ),
    GoRoute(
      path: '/${AppRoutes.propertyRoomListHome}',
      pageBuilder: (context, state) =>
          customTransitionPage(state, ScreenHomePropertyRoomsList()),
    ),

    //Bottom navigation bar screens
    StatefulShellRoute.indexedStack(
      pageBuilder: (_, state, navigationShell) => customTransitionPage(
        state,
        ScreenNavigation(
          navigationShell: navigationShell,
        ),
      ),
      branches: [
        StatefulShellBranch(
          initialLocation: '/${AppRoutes.home}',
          navigatorKey: _sectionNavigatorKey,
          routes: [
            GoRoute(
              path: '/${AppRoutes.home}',
              pageBuilder: (_, state) {
                return customTransitionPage(
                  state,
                  ScreenHome(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/${AppRoutes.search}',
              pageBuilder: (_, state) {
                return customTransitionPage(
                  state,
                  ScreenSearch(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/${AppRoutes.profile}',
              pageBuilder: (_, state) {
                return customTransitionPage(
                  state,
                  ScreenProfile(),
                );
              },
            ),
          ],
        ),
      ],
    )
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
