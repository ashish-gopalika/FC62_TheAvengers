import 'package:flutter/material.dart';

class forgotPass extends StatefulWidget {
  const forgotPass({Key? key}) : super(key: key);

  @override
  State<forgotPass> createState() => _forgotPassState();
}

class _forgotPassState extends State<forgotPass> {
  final GlobalKey<FormState> _form=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      key: _form,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
