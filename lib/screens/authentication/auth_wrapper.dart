import 'package:enduserapp/database/shared_preference_db.dart';
import 'package:enduserapp/screens/asset_loader.dart';
import 'package:enduserapp/screens/authentication/login_screen.dart';
import 'package:enduserapp/screens/bottom_navigator.dart';
import 'package:enduserapp/screens/loading_screens/loading.dart';
import 'package:enduserapp/screens/loading_screens/main_loading.dart';
import 'package:flutter/material.dart';

import '../main_wrapper.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: SharedPreferenceDB.getValue('name'),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.data==null) {
          return const MainWrapper();
        } else if (snapshot.hasData) {
          print('going to assets...');
          return const AssetLoader();
        } else if (snapshot.hasError) {
          return const LoginScreen();
        } else {
          return const MainLoader();
        }
      },
    );
  }
}
