import 'package:flutter/material.dart';

///Loading Screen stateless widget
class MainLoader extends StatelessWidget {
  const MainLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const SizedBox(height: 10,),
              const Text(
                'Healthy you is the happy you',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  letterSpacing: 5,
                ),
              ),
              const SizedBox(height: 30,),
              const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
