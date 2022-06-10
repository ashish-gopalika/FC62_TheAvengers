import 'package:enduserapp/screens/authentication/login_screen.dart';
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
                      ..color = Colors.black87,
                  ),
                ),
                const Text(
                  'MEDEFIND',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.transparent,
                    letterSpacing: 3,
                  ),
                ),
              ]),
              const Text(
                'Healthy you is the happy you',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  letterSpacing: 5,
                ),
              ),
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
                              backgroundColor:  MaterialStateProperty.all<Color>(Colors.blueAccent),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.blueAccent)),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 30.0, right: 30.0, top: 12, bottom: 12),
                              child: Text(
                                "Get Started",
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
