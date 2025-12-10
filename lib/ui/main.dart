import 'package:flutter/material.dart';
import 'package:ju_reminder/bs/Basic.dart';
import 'package:ju_reminder/constants/routers.dart';
import 'package:ju_reminder/ui/details/details_page.dart';
import 'package:ju_reminder/ui/login/login_page.dart';
import 'package:ju_reminder/ui/splash/splash_screen.dart';

import '../constants/constants.dart';
import '../themes/theme.dart';
import 'home/home_page.dart';

const TAG = "JuReminder: ";

void main() {
  runApp(const MyApp());

  const basic = Basic();
  basic.test();
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
        rLogin: (context) => const LoginScreen(),
        rHome: (context) => const MyHomePage(title: kAppName),
        rDetails: (context) => const DetailsPage(),
      },
    );
  }
}
