import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:user_resort_booking_app/core/constants/theme.dart';
import 'package:user_resort_booking_app/core/data/providers/user_provider.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/core/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:user_resort_booking_app/feature/authentication/model/user_local_data_model.dart';
import 'package:user_resort_booking_app/feature/authentication/repository/auth_repository.dart';
import 'package:user_resort_booking_app/feature/authentication/repository/user_local_repository.dart';
import 'package:user_resort_booking_app/feature/authentication/services/auth_service.dart';
import 'package:user_resort_booking_app/feature/authentication/services/user_local_service.dart';
import 'package:user_resort_booking_app/feature/authentication/view%20model/bloc/bloc_auth/auth_bloc.dart';
import 'package:user_resort_booking_app/feature/home/repository/property_home_repository.dart';
import 'package:user_resort_booking_app/feature/home/services/property_home_services.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_details/property_details_home_bloc.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_home_list/property_list_home_bloc.dart';
import 'package:user_resort_booking_app/feature/home/view_model/bloc/bloc_property_room_list/property_home_room_list_bloc.dart';
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

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserLocalDataModelAdapter().typeId)) {
    Hive.registerAdapter(UserLocalDataModelAdapter());
  }

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

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyScreenSize.initialize(context);

    print(MyScreenSize());
    return MultiRepositoryProvider(
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
          create: (context) =>
              PropertyHomeRepository(services: PropertyHomeServices()),
        ),
        RepositoryProvider(
          create: (context) =>
              MyPropertyRepository(services: MyPropertyServices()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PropertyListHomeBloc(context.read<PropertyHomeRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                MyPropertyListBloc(context.read<MyPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) => FilterDataCubit(),
          ),
          BlocProvider(
            create: (context) => GoogleMapBloc(),
          ),
          BlocProvider(
            create: (context) =>
                PropertyTypeCubit(context.read<MyPropertyRepository>()),
          ),
          BlocProvider(
            create: (context) => PropertyDetailsHomeBloc(
              context.read<PropertyHomeRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => PropertyHomeRoomListBloc(
              context.read<PropertyHomeRepository>(),
            ),
          ),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => UserProvider(
                authRepository: context.read<AuthRepository>(),
                userLocalRepository: context.read<UserLocalRepository>(),
              ),
            ),
          ],
          builder: (context, state) {
            return MaterialApp.router(
              routerConfig: routes,
              debugShowCheckedModeBanner: false,
              theme: customTheme,
            );
          },
        ),
      ),
    );
  }
}
