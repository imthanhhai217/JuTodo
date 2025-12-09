import 'package:flutter/material.dart';

import '../../MyTextView.dart';
import '../../constants/constants.dart';
import '../../constants/routers.dart';
import '../../constants/spacing.dart';
import '../../widgets/clickable_wrapper.dart';
import '../../widgets/image_loader.dart';
import '../details/details_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [profileRow(userName: "Haisendbug")],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Row profileRow({required String userName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageNetworkLoader(url: kDefaultAvatar),
            ),
          ),
        ),

        Expanded(
          flex: 2,
          child: ClickableWrapper(
            child: Text(userName, textAlign: TextAlign.center),
            onClick: () => navigationToDetails(userName),
          ),
        ),
      ],
    );
  }

  Column demoColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.eighteen_mp),
            MyTextView(text: "Counter : "),
            MyTextView(text: _counter.toString()),
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(kDefaultMargin),
          child: Stack(
            children: [
              Container(width: 100, height: 100, color: Colors.blue),
              Positioned(
                top: 25,
                left: 25,
                child: Container(width: 50, height: 50, color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void navigationToDetails(String data) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsPage(message: data)),
    );
  }

  void navigate2Login() {
    Navigator.pushNamed(context, rLogin);
  }
}
