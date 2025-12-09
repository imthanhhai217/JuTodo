import 'package:flutter/material.dart';
import 'package:ju_reminder/MyTextView.dart';
import 'package:ju_reminder/bs/Basic.dart';
import 'package:ju_reminder/constants/routers.dart';
import 'package:ju_reminder/constants/spacing.dart';
import 'package:ju_reminder/ui/details/details_page.dart';
import 'package:ju_reminder/ui/splash/splash_screen.dart';
import 'package:ju_reminder/widgets/clickable_wrapper.dart';
import 'package:ju_reminder/widgets/image_loader.dart';

import '../constants/constants.dart';

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
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.cyanAccent)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
