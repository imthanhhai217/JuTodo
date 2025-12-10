import 'package:flutter/material.dart';
import 'package:ju_reminder/constants/routers.dart';

import '../../MyTextView.dart';
import '../../constants/constants.dart';
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
  var _isLoggedIn = false;
  String _userName = "";

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
        child: _isLoggedIn
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  profileRow(userName: _userName),
                  SizedBox(height: kDefaultMargin),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isLoggedIn = false;
                        _userName = "";
                      });
                    },
                    child: Text("Logout"),
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.pushNamed(context, rLogin);
                  if (result != null && result is String) {
                    setState(() {
                      _isLoggedIn = true;
                      _userName = result;
                    });
                  }
                },
                child: Text("Login"),
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
}
