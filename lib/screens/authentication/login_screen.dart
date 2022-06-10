import 'package:fc62_theavengers/screens/authentication/emailloginwrapper.dart';
import 'package:fc62_theavengers/screens/authentication/register_screen.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36.0,0.0,36.0,0.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
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
                        prefixIcon: const Icon(Icons.mail),
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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
                          prefixIcon: const Icon(Icons.password),
                          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 55,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: (){
                          final String email = emailController.text;
                          final String password = passwordController.text;
                          if(_formkey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmailLoginWrapper(email: email,password: password)),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:  MaterialStateProperty.all<Color>(Colors.black),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.transparent)),
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
                    const SizedBox(height: 50,),
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
