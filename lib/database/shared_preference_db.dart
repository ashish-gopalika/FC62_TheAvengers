import 'package:enduserapp/model/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_data.dart';

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
    UserData.endUserModel.uid=prefs.getString('uid');
    UserData.endUserModel.email=prefs.getString('email');
    UserData.endUserModel.name=prefs.getString('name');
    UserData.endUserModel.phoneNumber=prefs.getString('phoneNumber');
    value = prefs.getString(valueName);
    return value;
  }

  static void resetPreferences() async{
    SharedPreferences prefs = await _sharedPreferences;
    await prefs.clear();
  }

}