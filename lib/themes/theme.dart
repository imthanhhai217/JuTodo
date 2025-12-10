import 'package:flutter/material.dart';
import 'package:ju_reminder/themes/app_button_style.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppButtonStyles.elevatePrimaryButtonStyle,
    ),
  );
}
