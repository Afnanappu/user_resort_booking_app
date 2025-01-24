import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_resort_booking_app/core/constants/theme.dart';
import 'package:user_resort_booking_app/core/data/repository/review_repository.dart';
import 'package:user_resort_booking_app/core/data/repository/user_repository.dart';
import 'package:user_resort_booking_app/core/data/services/notification_services.dart';
import 'package:user_resort_booking_app/core/data/services/review_services.dart';
import 'package:user_resort_booking_app/core/data/services/transaction_services.dart';
import 'package:user_resort_booking_app/core/data/services/user_services.dart';
import 'package:user_resort_booking_app/core/data/view_model/bloc/bloc_notification/notification_bloc.dart';
import 'package:user_resort_booking_app/core/data/view_model/cubit/user_data_cubit.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:user_resort_booking_app/feature/authentication/repository/auth_repository.dart';
import 'package:user_resort_booking_app/feature/authentication/repository/user_local_repository.dart';
import 'package:user_resort_booking_app/feature/authentication/services/auth_service.dart';
import 'package:user_resort_booking_app/feature/authentication/services/user_local_service.dart';
import 'package:user_resort_booking_app/feature/authentication/view%20model/bloc/bloc_auth/auth_bloc.dart';
import 'package:user_resort_booking_app/feature/booking/repository/booking_repository.dart';
import 'package:user_resort_booking_app/feature/booking/services/booking_service.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/bloc/bloc_booking/booking_bloc.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/bloc/bloc_property_room_list/property_room_list_bloc.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/bloc/bloc_room_details/property_room_details_bloc.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_details_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_date_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_select_people_cubit.dart';
import 'package:user_resort_booking_app/feature/booking/view_model/cubit/booking_selected_rooms_cubit.dart';
import 'package:user_resort_booking_app/feature/home/repository/property_home_repository.dart';
import 'package:user_resort_booking_app/feature/home/services/property_home_services.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_home_extra_list/property_home_extra_list_bloc.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_home_list/property_list_home_bloc.dart';
import 'package:user_resort_booking_app/feature/my_bookings/repository/my_booking_repository.dart';
import 'package:user_resort_booking_app/feature/my_bookings/services/my_booking_services.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/bloc/bloc/review_bloc.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/bloc/bloc_booked_property_details/booked_property_details_bloc.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/bloc/bloc_booked_property_list/booked_property_list_bloc.dart';
import 'package:user_resort_booking_app/feature/my_bookings/view_model/cubit/rating_count_cubit.dart';
import 'package:user_resort_booking_app/feature/profile/repository/payment_history_repository.dart';
import 'package:user_resort_booking_app/feature/profile/view_model/bloc/payment_history_bloc.dart';
import 'package:user_resort_booking_app/feature/search/repository/my_property_repository.dart';
import 'package:user_resort_booking_app/feature/search/services/my_property_services.dart';
import 'package:user_resort_booking_app/feature/search/view_model/bloc_property_list/my_property_list_bloc.dart';
import 'package:user_resort_booking_app/feature/search/view_model/cubit/filter_data_cubit.dart';
import 'package:user_resort_booking_app/feature/search/view_model/cubit/property_type_cubit.dart';
import 'package:user_resort_booking_app/firebase_options.dart';
import 'package:user_resort_booking_app/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final notificationService = NotificationServices();
  // ..initNotification();

  //initializing notification for  this app
  // await NotificationServices().initNotification();

  // await Hive.initFlutter();
  // if (!Hive.isAdapterRegistered(UserLocalDataModelAdapter().typeId)) {
  //   Hive.registerAdapter(UserLocalDataModelAdapter());
  // }

  // if (kDebugMode) {
  //   try {
  //     // final deviceIp = '172.16.4.113';
  //     final deviceIp = ' 192.168.1.25';
  //     await FirebaseAuth.instance.useAuthEmulator(deviceIp, 9099);
  //     FirebaseFirestore.instance.useFirestoreEmulator(deviceIp, 8089);
  //     log('Backend is running on Firebase Local Emulator');
  //     log('Connected to Firestore and auth locally');
  //   } catch (e) {
  //     log(e.toString());
  //     log('Error while connecting to Firebase Local Emulator');
  //   }
  // }

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
            authService: AuthService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => UserLocalRepository(
            userLocalServices: UserLocalServices(),
          ),
        ),
        RepositoryProvider(
          create: (context) => PropertyHomeRepository(
            services: PropertyHomeServices(
              ReviewServices(),
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) =>
              MyPropertyRepository(services: MyPropertyServices()),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(services: UserServices()),
        ),
        RepositoryProvider(
          create: (context) => MyBookingRepository(
            services: MyBookingServices(),
          ),
        ),
        RepositoryProvider(
          create: (context) => ReviewRepository(
            ReviewServices(),
          ),
        ),
        RepositoryProvider(
          create: (context) => BookingRepository(
            service: BookingService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => PaymentHistoryRepository(
            transactionServices: TransactionServices(),
          ),
        ),
        RepositoryProvider(
          create: (context) => GoogleMapBloc(),
        ),
      ],

      //Providers
      child: MultiBlocProvider(
        providers: [
          //notification
          BlocProvider(create: (context) {
            log('working on bloc provider to initialize bloc');
            return NotificationBloc(notificationService);
            // ..add(
            //   NotificationEvent.initNotification(),
            // );
          }),

          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PropertyListHomeBloc(context.read<PropertyHomeRepository>()),
          ),
          BlocProvider(
            create: (context) => MyPropertyListBloc(
              repository: context.read<MyPropertyRepository>(),
              googleMapBloc: context.read<GoogleMapBloc>(),
            ),
          ),
          BlocProvider(
            create: (context) => FilterDataCubit(),
          ),
          BlocProvider(
            create: (context) => GoogleMapBloc(),
          ),
          BlocProvider(
            create: (context) => BookingDetailsCubit(),
          ),
          BlocProvider(
            create: (context) => BookingSelectPeopleCubit(),
          ),
          BlocProvider(
            create: (context) => BookingSelectDateCubit(),
          ),
          BlocProvider(
            create: (context) => RatingCountCubit(),
          ),
          BlocProvider(
            create: (context) =>
                PaymentHistoryBloc(context.read<PaymentHistoryRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                BookedPropertyDetailsBloc(context.read<MyBookingRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PropertyRoomDetailsBloc(context.read<BookingRepository>()),
          ),
          BlocProvider(
            create: (context) => BookingSelectedRoomsCubit(),
          ),
          BlocProvider(
            create: (context) => ReviewBloc(context.read<ReviewRepository>()),
          ),
          BlocProvider(
            create: (context) => UserDataCubit(context.read<UserRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PropertyTypeCubit(context.read<MyPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) => BookedPropertyListBloc(
              context.read<MyBookingRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => PropertyDetailsHomeBloc(
              context.read<PropertyHomeRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) =>
                PropertyRoomListBloc(context.read<BookingRepository>()),
          ),
          BlocProvider(
            create: (context) => BookingBloc(context.read<BookingRepository>()),
          ),
          BlocProvider(
            create: (context) => PropertyHomeExtraListBloc(
              context.read<PropertyHomeRepository>(),
            ),
          ),
        ],
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyScreenSize.initialize(context);
    context.read<NotificationBloc>().add(
          NotificationEvent.initNotification(),
        );

    print(MyScreenSize());
    return MaterialApp.router(
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
      theme: customTheme,
    );
  }
}
