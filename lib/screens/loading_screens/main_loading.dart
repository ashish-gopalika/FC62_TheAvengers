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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:const <Widget>[
              Text(
                'MEDEFIND',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
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
