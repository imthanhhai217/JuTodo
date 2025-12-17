import 'package:go_router/go_router.dart';
import 'package:ju_reminder/constants/constants.dart';
import 'package:ju_reminder/presentation/auth/login_page.dart';
import 'package:ju_reminder/presentation/details/details_page.dart';
import 'package:ju_reminder/presentation/generate/generate_page.dart';
import 'package:ju_reminder/presentation/history/history_page.dart';
import 'package:ju_reminder/presentation/home/home_page.dart';
import 'package:ju_reminder/presentation/main_wrapper.dart';
import 'package:ju_reminder/presentation/profile/profile_page.dart';
import 'package:ju_reminder/presentation/splash/splash_screen.dart';
import 'package:ju_reminder/presentation/studio/studio_page.dart';
import 'package:ju_reminder/presentation/templates/template_page.dart';

const rSplash = '/';
const rHome = '/home';
const rLogin = '/auth';
const rDetails = '/details';
const rTemplate = '/templates';
const rStudio = '/studio';
const rProfile = '/profile';
const rHistory = '/history';
const rGenerate = '/generate';

final GoRouter appRouter = GoRouter(
  // Màn hình đầu tiên mở khi chạy app
  initialLocation: rSplash,
  routes: [
    /// -------------------------------
    ///  SHELL ROUTE – dùng cho bottom navigation
    ///  Tất cả màn trong ShellRoute đều có NavigationBar
    /// -------------------------------
    ShellRoute(
      routes: [
        GoRoute(
          path: rHome,
          builder: (context, state) => MyHomePage(title: kAppName),
        ),
        GoRoute(path: rTemplate, builder: (context, state) => TemplatePage()),
        GoRoute(path: rStudio, builder: (context, state) => StudioPage()),
        GoRoute(path: rProfile, builder: (context, state) => ProfilePage()),
      ],
      // Wrapper bao quanh các màn có Bottom Navigation
      builder: (context, state, child) {
        return MainWrapper(child: child);
      },
    ),

    /// -------------------------------
    ///  Các màn KHÔNG có NavigationBar
    /// -------------------------------
    GoRoute(path: rSplash, builder: (context, state) => SplashScreen()),
    GoRoute(path: rLogin, builder: (context, state) => LoginScreen()),
    GoRoute(
      path: rDetails,
      builder: (context, state) {
        final productDetails = state.extra as String?;
        return DetailsPage(productDetails);
      },
    ),
    GoRoute(path: rHistory, builder: (context, state) => HistoryPage()),
    GoRoute(path: rGenerate, builder: (context, state) => GeneratePage()),
  ],
);
