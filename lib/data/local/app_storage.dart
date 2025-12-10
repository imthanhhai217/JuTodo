import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static const keyUserName = "key_user_name";

  static Future<void> saveUserName(String? userName) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(keyUserName, userName ?? "");
  }

  static Future<String?> getUserName() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(keyUserName);
  }

  static Future<void> logout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(keyUserName);
  }
}
