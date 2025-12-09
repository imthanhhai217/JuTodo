import 'package:flutter/material.dart';

class ClickableWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onClick;

  const ClickableWrapper({super.key, required this.child, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(onTap: onClick, child: child),
    );
  }
}
