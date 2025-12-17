import 'package:flutter/cupertino.dart';

class StudioPage extends StatefulWidget {
  const StudioPage({super.key});

  @override
  State<StudioPage> createState() => _StudioPageState();
}

class _StudioPageState extends State<StudioPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Studio Page"),
      ),
    );
  }
}
