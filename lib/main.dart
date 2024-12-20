import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:user_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:user_resort_booking_app/core/constants/my_colors.dart';
import 'package:user_resort_booking_app/core/data/providers/user_provider.dart';
import 'package:user_resort_booking_app/core/utils/screen_size.dart';
import 'package:user_resort_booking_app/feature/authentication/model/user_local_data_model.dart';
import 'package:user_resort_booking_app/feature/authentication/repository/auth_repository.dart';
import 'package:user_resort_booking_app/feature/authentication/repository/user_local_repository.dart';
import 'package:user_resort_booking_app/feature/authentication/services/auth_service.dart';
import 'package:user_resort_booking_app/feature/authentication/services/user_local_service.dart';
import 'package:user_resort_booking_app/feature/authentication/view%20model/bloc/bloc_auth/auth_bloc.dart';
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

  if (kDebugMode) {
    try {
      final deviceIp = '172.16.4.113';
      // await FirebaseAuth.instance.useAuthEmulator(deviceIp, 9099);
      FirebaseFirestore.instance.useFirestoreEmulator(deviceIp, 8089);
      log('Backend is running on Firebase Local Emulator');
      log('Connected to Firestore and auth locally');
    } catch (e) {
      log(e.toString());
      log('Error while connecting to Firebase Local Emulator');
    }
  }

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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
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
              // theme: theme,
            );
          },
        ),
      ),
    );
  }
}
