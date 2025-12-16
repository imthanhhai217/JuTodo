import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_reminder/constants/app_routers.dart';
import 'package:ju_reminder/data/local/hive/hive_storage.dart';
import 'package:ju_reminder/data/repositories/auth_repository.dart';
import 'package:ju_reminder/data/repositories/product_repository.dart';
import 'package:ju_reminder/di/locator.dart';
import 'package:ju_reminder/presentation/auth/bloc/auth_bloc.dart';
import 'package:ju_reminder/presentation/common/global_loading/cubit/loading_cubit.dart';
import 'package:ju_reminder/presentation/common/global_loading/global_loading_overlay.dart';
import 'package:ju_reminder/presentation/products/bloc/product_bloc.dart';

import 'themes/theme.dart';

const TAG = "JuReminder: ";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveStorage.init();
  setupGetItLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc(getIt<AuthRepository>())),
        BlocProvider(create: (_) => LoadingCubit()),
        BlocProvider(create: (context) => ProductBloc(getIt<ProductRepository>())),
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
      routerConfig: appRouter,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return GlobalLoadingOverlay(child: child ?? SizedBox.expand());
      },
    );
  }
}
