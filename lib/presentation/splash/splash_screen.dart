import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ju_reminder/constants/app_routers.dart';
import 'package:ju_reminder/constants/constants.dart';
import 'package:ju_reminder/widgets/image_loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        context.go(rHome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: ImageNetworkLoader(url: kDefaultAvatar),
          ),
        ),
      ),
    );
  }
}
