import 'package:fc62_theavengers/screens/main.dart';
import 'package:fc62_theavengers/services/email_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Home'),
          const SizedBox(height: 20,),
          SizedBox(
            height: 55,
            width: 200,
            child: ElevatedButton(
              onPressed: (){
                EmailAuth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.all<Color>(Colors.blueAccent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.transparent)),
                ),
              ),
              child: const Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
