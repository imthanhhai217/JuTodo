import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String? message;

  const DetailsPage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details Page")),
      body: Center(child: Text(message ?? "No message provided")),
    );
  }
}
