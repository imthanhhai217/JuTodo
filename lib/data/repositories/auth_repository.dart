import 'package:ju_reminder/data/local/hive/hive_storage.dart';
import 'package:ju_reminder/main.dart';

import '../../bs/Basic.dart';

class AuthRepository {
  Future<bool> login(String email, String password) async {
    print('$TAG AuthRepository - Login attempt: email=$email');

    if (email == "test@gmail.com" && password == "123456") {
      print('$TAG AuthRepository - Valid credentials, saving to Hive');
      await HiveStorage.saveUserEmail(email);
      await HiveStorage.saveIsLogin(true);
      print('$TAG AuthRepository - Login successful');
      return true;
    }

    print('$TAG AuthRepository - Invalid credentials');
    return false;
  }

  Future<void> logout() async {
    print('$TAG AuthRepository - Logout');
    await HiveStorage.clearUser();
  }

  String? getCurrentUser() {
    final email = HiveStorage.getUserEmail();
    print('$TAG AuthRepository - Get current user: $email');
    return email;
  }
}
