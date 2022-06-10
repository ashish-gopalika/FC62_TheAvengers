import 'package:enduserapp/screens/loading_screens/main_loading.dart';
import 'package:enduserapp/screens/main.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
      future: Future.delayed(const Duration(seconds: 2)).then((value) => true),
      builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
        if (snapshot.data==true) {
          return const MainScreen();
        } else if (snapshot.hasError) {
          return const MainScreen();
        } else {
          return const MainLoader();
        }
      },
    );
  }
}
