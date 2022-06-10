import 'package:fc62_theavengers/screens/authentication/login_screen.dart';
import 'package:fc62_theavengers/screens/bottom_navigator.dart';
import 'package:fc62_theavengers/screens/loading_screens/loading.dart';
import 'package:fc62_theavengers/services/email_auth.dart';
import 'package:flutter/material.dart';

class EmailLoginWrapper extends StatefulWidget {
  const EmailLoginWrapper({Key? key, required this.email, required this.password}) : super(key: key);
  final String email;
  final String password;

  @override
  State<EmailLoginWrapper> createState() => _EmailLoginWrapperState();
}

class _EmailLoginWrapperState extends State<EmailLoginWrapper> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: EmailAuth.loginWithEmail(widget.email, widget.password,context),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data==true) {
            return const BottomNavigator();
          } else if (snapshot.hasData && snapshot.data==false) {
            return const LoginScreen();
          } else if (snapshot.hasError) {
            return Text(snapshot.data.toString());
          } else {
            return const Loader();
          }
        },
      );
  }
}
