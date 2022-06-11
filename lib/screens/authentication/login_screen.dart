import 'package:enduserapp/screens/authentication/emailloginwrapper.dart';
import 'package:enduserapp/screens/authentication/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipPath(
                        clipper: OvalBottomBorderClipper(),
                        child: Container(
                          height:MediaQuery.of(context).size.height*0.15,
                          color: Colors.blueAccent,
                          child: Center(
                            child:Text(""),
                          ),)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.16,
                    ),
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,),),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.01,
                    ),
                    const Text(
                      'Now, Get Medicines on just one click!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                      ),
                    ),
                  ],),
                Padding(
                  padding: const EdgeInsets.fromLTRB(36.0,0.0,36.0,0.0),
                  child: Form(
                    key:_formkey,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.07,
                        ),
                        TextFormField(
                          autofocus: false,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Some Text';
                            }
                            if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[a-z]").hasMatch(value)) {
                              return "Please Enter a Valid Email";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: " Enter your Email",
                            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.05,
                        ),
                        TextFormField(
                          autofocus: false,
                          obscureText: true,
                          controller: passwordController,
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          validator: (value){
                            RegExp regex = RegExp(r'^.{6,}$');
                            if(value!.isEmpty){
                              return ("Password is required for login");
                            }
                            if(!regex.hasMatch(value)){
                              return("Please Enter valid password(Min. 6 character)");
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.lock_open_outlined,color: Colors.grey,),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Enter your password",
                              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.04,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.06,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: (){
                              final String email = emailController.text;
                              final String password = passwordController.text;
                              if(_formkey.currentState!.validate()) {
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    EmailLoginWrapper(email: email,password: password)), (Route<dynamic> route) => false);
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => EmailLoginWrapper(email: email,password: password)),
                                // );
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:  MaterialStateProperty.all<Color>(Colors.blueAccent),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.blueAccent)),
                              ),
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                                );
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
