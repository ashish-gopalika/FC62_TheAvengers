//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'firebase_options.dart';
//import 'package:fc62_theavengers/screens/authentication/auth_wrapper.dart';

//Future<void> main() async{
//  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp(
 //   options: DefaultFirebaseOptions.currentPlatform,
 // );
  //runApp(const MyApp());
//}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //body: AuthWrapper(),
    );
  }
}