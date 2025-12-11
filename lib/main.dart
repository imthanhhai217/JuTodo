import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_reminder/constants/routers.dart';
import 'package:ju_reminder/data/local/hive/hive_storage.dart';
import 'package:ju_reminder/data/repositories/auth_repository.dart';
import 'package:ju_reminder/presentation/auth/bloc/auth_bloc.dart';
import 'package:ju_reminder/presentation/splash/splash_screen.dart';

import 'constants/constants.dart';
import 'presentation/auth/login_page.dart';
import 'presentation/details/details_page.dart';
import 'presentation/home/home_page.dart';
import 'themes/theme.dart';

const TAG = "JuReminder: ";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveStorage.init();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        rLogin: (context) => LoginScreen(),
        rHome: (context) => const MyHomePage(title: kAppName),
        rDetails: (context) => const DetailsPage(),
      },
    );
  }
}
