import 'package:flutter/material.dart';
import 'package:ju_reminder/constants/constants.dart';
import 'package:ju_reminder/constants/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(child: Center(child: Text("Login Page")));
  }

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  String _userName = "";
  String _password = "";
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(kLoginTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _loginFormKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Username"),
                keyboardType: TextInputType.text,
                validator: Validator.validatorEmail,
                onSaved: (newValue) {
                  _userName = newValue ?? "";
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                keyboardType: TextInputType.text,
                validator: Validator.validatorPassword,
                onSaved: (newValue) {
                  _password = newValue ?? "";
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_loginFormKey.currentState?.validate() ?? false) {
                      _loginFormKey.currentState?.save();
                      var userName = _userName.trim();
                      // Perform login action with _userName and _password
                      if (userName == "test@gmail.com" &&
                          _password == "123456") {
                        // Navigate to home page or show success message
                        Navigator.pop(context, userName);
                      } else {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Invalid username or password"),
                          ),
                        );
                      }
                    }
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
