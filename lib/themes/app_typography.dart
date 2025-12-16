import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTypography {
  static const title = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const body = TextStyle(fontSize: 16, fontWeight: FontWeight.normal);
  static const mini = TextStyle(fontSize: 12, fontWeight: FontWeight.normal);
  static final miniError = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColor.textError);
  static const dialogLoadingMessage = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white);
}
