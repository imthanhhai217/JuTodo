import 'package:flutter/material.dart';
import 'package:ju_reminder/constants/routers.dart';
import 'package:ju_reminder/data/local/app_storage.dart';
import 'package:ju_reminder/themes/app_button_style.dart';

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
  var _isLoggedIn = false;
  String _userName = "";

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
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: AppButtonStyles.elevateWhiteButtonStyle,
                      onPressed: () async {
                        await AppStorage.logout();
                        setState(() {
                          _isLoggedIn = false;
                          _userName = "";
                        });
                      },
                      child: Text("Logout"),
                    ),
                  ),
                ],
              )
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
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

  void navigationToDetails(String data) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsPage(message: data)),
    );
  }
}
