import 'package:flutter/material.dart';
import 'package:ju_reminder/themes/app_color.dart';

class AppButtonStyles {
  static const double borderRadius = 8.0;
  static const double paddingVertical = 12.0;
  static const double paddingHorizontal = 16.0;

  static final elevatePrimaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColor.primary,
    foregroundColor: Colors.black87,
    padding: const EdgeInsets.symmetric(
      vertical: paddingVertical,
      horizontal: paddingHorizontal,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(borderRadius),
    ),
  );

  static final elevateWhiteButtonStyle = elevatePrimaryButtonStyle.copyWith(
    backgroundColor: WidgetStatePropertyAll(Colors.white),
    foregroundColor: WidgetStatePropertyAll(Colors.black)
  );
}
