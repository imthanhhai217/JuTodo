import 'package:go_router/go_router.dart';
import 'package:ju_reminder/constants/constants.dart';
import 'package:ju_reminder/presentation/auth/login_page.dart';
import 'package:ju_reminder/presentation/details/details_page.dart';
import 'package:ju_reminder/presentation/home/home_page.dart';
import 'package:ju_reminder/presentation/splash/splash_screen.dart';

const rSplash = '/';
const rHome = '/home';
const rLogin = '/auth';
const rDetails = '/details';

final GoRouter appRouter = GoRouter(
  initialLocation: rSplash,
  routes: [
    GoRoute(path: rSplash, builder: (context, state) => SplashScreen()),
    GoRoute(
      path: rHome,
      builder: (context, state) => MyHomePage(title: kAppName),
    ),
    GoRoute(path: rLogin, builder: (context, state) => LoginScreen()),
    GoRoute(path: rDetails, builder: (context, state) => DetailsPage()),
  ],
);
