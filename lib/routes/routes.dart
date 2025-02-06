import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_resort_booking_app/core/navigation/screen_navigation.dart';
import 'package:user_resort_booking_app/feature/authentication/views/screens/screen_login.dart';
import 'package:user_resort_booking_app/feature/authentication/views/screens/screen_sign_up.dart';
import 'package:user_resort_booking_app/feature/booking/views/screens/screen_payment.dart';
import 'package:user_resort_booking_app/feature/booking/views/screens/screen_property_room_details.dart';
import 'package:user_resort_booking_app/feature/booking/views/screens/screen_review_booking.dart';
import 'package:user_resort_booking_app/feature/profile/view/screens/screen_about.dart';
import 'package:user_resort_booking_app/feature/profile/view/screens/screen_favorite.dart';
import 'package:user_resort_booking_app/feature/home/views/screens/screen_home.dart';
import 'package:user_resort_booking_app/feature/home/views/screens/screen_home_property_details_.dart';
import 'package:user_resort_booking_app/feature/booking/views/screens/screen_property_room_list.dart';
import 'package:user_resort_booking_app/feature/home/views/screens/screen_notification.dart';
import 'package:user_resort_booking_app/feature/my_bookings/views/screens/screen_booked_property_details.dart';
import 'package:user_resort_booking_app/feature/my_bookings/views/screens/screen_my_bookings.dart';
import 'package:user_resort_booking_app/feature/onboarding/views/screens/screen_onboarding_2.dart';
import 'package:user_resort_booking_app/feature/onboarding/views/screens/screen_onboarding.dart';
import 'package:user_resort_booking_app/feature/onboarding/views/screens/screen_splash.dart';
import 'package:user_resort_booking_app/feature/profile/view/screens/screen_payment_history.dart';
import 'package:user_resort_booking_app/feature/profile/view/screens/screen_profile.dart';
import 'package:user_resort_booking_app/feature/profile/view/screens/screen_report_issue.dart';
import 'package:user_resort_booking_app/feature/profile/view_model/cubit/cubit_report_issue/report_issue_cubit.dart';
import 'package:user_resort_booking_app/feature/search/view/screens/screen_search.dart';
import 'package:user_resort_booking_app/routes/custom_route_transition.dart';
import 'package:user_resort_booking_app/routes/route_names.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final routes = GoRouter(
  initialLocation: '/${AppRoutes.splash}',
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
          customTransitionPage(state, ScreenOnboarding()),
    ),
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
      path: '/${AppRoutes.payment}',
      pageBuilder: (context, state) =>
          customTransitionPage(state, ScreenPayment()),
    ),
    GoRoute(
      path: '/${AppRoutes.reviewBooking}',
      pageBuilder: (context, state) =>
          customTransitionPage(state, ScreenReviewBooking()),
    ),
    // GoRoute(
    //   path: '/${AppRoutes.settings}',
    //   pageBuilder: (context, state) =>
    //       customTransitionPage(state, ScreenSettings()),
    // ),
    GoRoute(
      path: '/${AppRoutes.paymentHistory}',
      pageBuilder: (context, state) =>
          customTransitionPage(state, ScreenPaymentHistory()),
    ),
    GoRoute(
      path: '/${AppRoutes.notification}',
      pageBuilder: (context, state) =>
          customTransitionPage(state, ScreenNotification()),
    ),
    GoRoute(
      path: '/${AppRoutes.bookedPropertyDetails}',
      pageBuilder: (context, state) => customTransitionPage(
        state,
        ScreenBookedPropertyDetails(),
      ),
    ),
    GoRoute(
      path: '/${AppRoutes.propertyRoomList}',
      pageBuilder: (context, state) => customTransitionPage(
        state,
        ScreenPropertyRoomsList(),
      ),
    ),
    GoRoute(
      path: '/${AppRoutes.favorite}',
      pageBuilder: (context, state) => customTransitionPage(
        state,
        ScreenFavorite(),
      ),
    ),
    GoRoute(
      path: '/${AppRoutes.about}',
      pageBuilder: (context, state) => customTransitionPage(
        state,
        ScreenAbout(),
      ),
    ),
    GoRoute(
      path: '/${AppRoutes.reportIssue}',
      pageBuilder: (context, state) => customTransitionPage(
        state,
        BlocProvider(
          create: (context) => ReportIssueCubit(),
          child: ReportIssueScreen(),
        ),
      ),
    ),
    GoRoute(
      path: '/${AppRoutes.propertyRoomDetails}',
      pageBuilder: (context, state) => customTransitionPage(
        state,
        ScreenPropertyRoomDetails(),
      ),
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
              path: '/${AppRoutes.myBookings}',
              pageBuilder: (_, state) {
                return customTransitionPage(
                  state,
                  ScreenMyBookings(),
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
                  // ScreenPaymentHistory()
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
