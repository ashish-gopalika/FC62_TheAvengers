import 'package:fc62_theavengers/screens/authentication/login_screen.dart';
import 'package:fc62_theavengers/screens/authentication/register_screen.dart';
import 'package:fc62_theavengers/screens/loading_screens/loading.dart';
import 'package:fc62_theavengers/services/email_auth.dart';
import 'package:flutter/material.dart';

class EmailSignUpWrapper extends StatefulWidget {
  const EmailSignUpWrapper({Key? key, required this.email, required this.password, required this.name}) : super(key: key);
  final String email;
  final String password;
  final String name;
  @override
  State<EmailSignUpWrapper> createState() => _EmailSignUpWrapperState();
}

class _EmailSignUpWrapperState extends State<EmailSignUpWrapper> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: EmailAuth.signUpWithEmail(widget.email, widget.password,widget.name,context),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data==true) {
          return const LoginScreen();
        } else if (snapshot.hasData && snapshot.data==false) {
          return const RegisterScreen();
        } else if (snapshot.hasError) {
          return Text(snapshot.data.toString());
        } else {
          return const Loader();
        }
      },
    );
  }
}
