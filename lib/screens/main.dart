//@dart=2.9
import 'package:fc62_theavengers/screens/authentication/forgotPassword.dart';
import 'package:fc62_theavengers/screens/authentication/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

import 'authentication/login_screen.dart';
void main() {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    initialRoute:"login",
    routes: {"login":(context)=>MyLogin(),"signup":(context)=>MySignUp(),"forgotPassword":(context)=>forgotPass()},
  ));
}