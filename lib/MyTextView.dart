import 'package:flutter/material.dart';

/*
Stateless widget là widget không có trạng thái (state), nghĩa là nó không thể
Thay đổi trạng thái sau khi được tạo ra
*/
class MyTextView extends StatelessWidget {
  final String text;

  MyTextView({this.text = "Default Text"});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
