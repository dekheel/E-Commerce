import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static late SharedPreferences sharedPreference;

  static String userTokenKey = "Token";

  static init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String key, required dynamic data}) {
    if (data is String) {
      return sharedPreference.setString(key, data);
    } else if (data is int) {
      return sharedPreference.setInt(key, data);
    } else if (data is double) {
      return sharedPreference.setDouble(key, data);
    } else {
      return sharedPreference.setBool(key, data);
    }
  }

  static Object? readData({required String key}) {
    return sharedPreference.get(key);
  }

  static Future<bool> removeUserToken() {
    return sharedPreference.remove(userTokenKey);
  }
}
