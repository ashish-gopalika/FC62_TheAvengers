import 'package:fc62_theavengers/screens/authentication/login_screen.dart';
import 'package:fc62_theavengers/screens/authentication/register_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //   colorFilter: ColorFilter.mode(Colors.white70, BlendMode.dstATop),
            //   image: AssetImage("assets/images/choosebg.jpg"),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Stack(children: [
                Text(
                  'MEDEFIND',
                  style: TextStyle(
                    fontSize: 45,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = Colors.black,
                  ),
                ),
                const Text(
                  'MEDEFIND',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                    letterSpacing: 3,
                  ),
                ),
              ]),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 250.0,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor:  MaterialStateProperty.all<Color>(Colors.black),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.black54)),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 32.0, right: 32.0, top: 12, bottom: 12),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 250.0,
                        height: 60,
                        child: ElevatedButton(
                          // textColor: NowUIColors.white,
                          // color: NowUIColors.primary,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterScreen()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:  MaterialStateProperty.all<Color>(Colors.black54),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(color: Colors.transparent)),
                            ),
                          ),

                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 32.0, right: 32.0, top: 12, bottom: 12),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
