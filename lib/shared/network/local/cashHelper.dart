import 'package:shared_preferences/shared_preferences.dart';

class cashHelper {
  static SharedPreferences? shared;
  static Future<void> init() async {
    shared = await SharedPreferences.getInstance();
  }

  static Future<bool> putbolean(
      {required String key, required bool value}) async {
    return await shared!.setBool(key, value);
  }

  static bool? getbolean({required String key}) {
  return  shared?.getBool(key);
  }
}
