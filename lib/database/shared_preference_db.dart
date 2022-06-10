import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDB{
  static final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();

  static Future<bool> setValue(String valueName, String? valueData) async{
    bool state = false;
    SharedPreferences prefs = await _sharedPreferences;
    await prefs.setString(valueName, valueData!).then((value) {
      state = true;
    });
    return state;
  }

  static Future<String?> getValue(String valueName) async{
    String? value='';
    SharedPreferences prefs = await _sharedPreferences;
    value = prefs.getString(valueName);
    return value;
  }

  static void resetPreferences() async{
    SharedPreferences prefs = await _sharedPreferences;
    await prefs.clear();
  }

}