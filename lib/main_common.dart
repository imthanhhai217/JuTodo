import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_reminder/constants/app_routers.dart';
import 'package:ju_reminder/core/config/app_config.dart';
import 'package:ju_reminder/core/constants/app_constants.dart';
import 'package:ju_reminder/data/local/hive/hive_storage.dart';
import 'package:ju_reminder/data/repositories/auth_repository.dart';
import 'package:ju_reminder/data/repositories/product_repository.dart';
import 'package:ju_reminder/di/locator.dart';
import 'package:ju_reminder/presentation/auth/bloc/auth_bloc.dart';
import 'package:ju_reminder/presentation/common/global_loading/cubit/loading_cubit.dart';
import 'package:ju_reminder/presentation/common/global_loading/global_loading_overlay.dart';
import 'package:ju_reminder/presentation/products/bloc/product_bloc.dart';
import 'package:ju_reminder/presentation/details/bloc/product_detail_bloc.dart';

import 'themes/theme.dart';

const TAG = "JuReminder: ";

/// Entry point chung cho tất cả môi trường
/// Được gọi từ main_dev.dart, main_staging.dart, main_prod.dart
void mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo Hive storage
  await HiveStorage.init();

  // Setup Dependency Injection với config từ môi trường
  setupGetItLocator();

  // Log môi trường hiện tại (chỉ trong dev/staging)
  if (AppConfig.instance.enableLogging) {
    debugPrint('$TAG Running in ${AppConfig.instance.environment} mode');
    debugPrint('$TAG API Base URL: ${AppConfig.instance.apiBaseUrl}');
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(getIt<AuthRepository>()),
        ),
        BlocProvider(create: (_) => LoadingCubit()),
        BlocProvider(create: (_) => ProductBloc(getIt<ProductRepository>())),
        BlocProvider(
          create: (_) => ProductDetailBloc(getIt<ProductRepository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Sử dụng app name từ config
      title: AppConfig.instance.appName,
      routerConfig: appRouter,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return GlobalLoadingOverlay(child: child ?? const SizedBox.expand());
      },
    );
  }
}
