import 'package:flutter/material.dart';
//import 'package:FC62_TheAvengers/screens/authentication/register_screen.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/bg.jpg"),
    fit: BoxFit.cover,
    )
    ),
    child:Scaffold(
    backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child:Container(
              height: 180,
              color:Colors.blueAccent,
              child: Center(
                child: Text("MEDEFIND",style:TextStyle(color:Colors.white,fontSize: 25,fontFamily: "courier",fontWeight:FontWeight.bold,letterSpacing:1 )),
              ),
            )
          ),
          Container(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.15,left:MediaQuery.of(context).size.width*0.37,right:MediaQuery.of(context).size.width*0.37),
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 50,
                child: Icon(Icons.person,
                    size:70),
              )
          ),
          SizedBox(
            height:20
          ),
          Container(
            padding: EdgeInsets.only(top:20),
            child: Text("Welcome Back",style:TextStyle(
              color: Colors.blueAccent,
              fontSize: 33,
            ),
            ),
          ),
        ],
      ),
    ));
  }
}
