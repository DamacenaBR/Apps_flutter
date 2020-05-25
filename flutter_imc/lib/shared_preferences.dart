import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesApi {
  static void setValor(String key, String valor) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, valor);
  }

  static Future<String> getValor(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }
}
