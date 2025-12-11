import 'package:hive_flutter/hive_flutter.dart';
import 'package:ju_reminder/data/local/hive/keys.dart';

class HiveStorage {
  static const String _boxName = "hive_ju_reminder";
  static late Box _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
  }

  static Future<void> _saveData<T>(String key, T value) async {
    await _box.put(key, value);
  }

  static T? _getValue<T>(String key, {T? defaultValue}) {
    return _box.get(key, defaultValue: defaultValue) as T?;
  }

  static String? getUserEmail() {
    return _getValue(AuthKeys.keyUserEmail, defaultValue: null);
  }

  static Future<void> saveUserEmail(String email) async {
    await _saveData(AuthKeys.keyUserEmail, email);
  }

  static bool isLogin() {
    return _getValue(AuthKeys.keyIsLogin) ?? false;
  }

  static Future<void> saveIsLogin(bool isLogin) async {
    await _saveData(AuthKeys.keyIsLogin, isLogin);
  }

  static Future<void> clearUser() async {
    await _box.delete(AuthKeys.keyUserEmail);
    await _box.delete(AuthKeys.keyIsLogin);
  }
}
