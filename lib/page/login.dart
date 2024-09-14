// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';
import 'package:ecommerceflutter/page/home.dart';
import 'package:ecommerceflutter/page/signup.dart';
import 'package:ecommerceflutter/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "";
  //! by this controller we can easily controll the text field

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//global key
  final _formkey = GlobalKey<FormState>();
  userLogin() async {
    try {
      // await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "wrong password provided by the user",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin:
            EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 40.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/login.png"),
                Text(
                  "Sign In",
                  style: AppWidget.seamiboldTextFeildStyle(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Please Enter the details to\n below to continue ",
                  style: AppWidget.lightTextFeildStyle(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Email ",
                  style: AppWidget.seamiboldTextFeildStyle(),
                ),
                // SizedBox(height: 10.0,),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFf2f5f9),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter your email";
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter Your Email"),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Password",
                  style: AppWidget.seamiboldTextFeildStyle(),
                ),
                // SizedBox (height: 10.0,),
                Container(
                  padding: EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFf2f5f9),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter your password";
                      }
                      return null;
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your Password"),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        email = emailController.text;
                        password = passwordController.text;
                      });
                    }
                    userLogin();
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      margin: EdgeInsets.only(bottom: 10.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Havae an accout?   ",
                      style: AppWidget.lightTextFeildStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
