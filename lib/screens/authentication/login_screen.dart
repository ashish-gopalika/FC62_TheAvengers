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
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.5,left:35,right:35),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:const BorderSide(width:1,color: Colors.blueAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:const BorderSide(width:1,color:Colors.redAccent),
                        )
                    ),
                  ),
                  SizedBox(
                      height:30
                  ),
                  TextFormField(
                    obscureText:true,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.lock_open_outlined,color: Colors.grey),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:const BorderSide(width:1,color: Colors.blueAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:const BorderSide(width:1,color:Colors.redAccent),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sign in",style: TextStyle(color: Colors.blueAccent,
                        fontSize: 27, fontWeight: FontWeight.w500,
                      )),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueAccent,
                        child: IconButton(
                            onPressed: (){
                              // Navigator.pushNamed(context, homescreen);
                            },
                            icon:Icon(Icons.arrow_forward,size: 30,)
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed:(){
                        Navigator.pushNamed(context, "forgotPassword");
                      },
                        child: Text("Forgot Password",style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 13,
                        ),),
                      ),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, "signup");
                      },
                          child:Text("Sign Up",style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 13, )))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
