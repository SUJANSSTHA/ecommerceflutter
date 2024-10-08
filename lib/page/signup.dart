import 'package:ecommerceflutter/page/bottomnav.dart';
import 'package:ecommerceflutter/page/login.dart';
import 'package:ecommerceflutter/services/data.dart';
import 'package:ecommerceflutter/services/shared_pref.dart';
import 'package:ecommerceflutter/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
//* variable
  String? name, email, password;
//! by this controller we can easily controll the text field
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//global key
  final _formkey = GlobalKey<FormState>();
// function for reg
  registration() async {
    if (password != null && name != null && email != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )));

        String Id = randomAlphaNumeric(10);
        // shared_preference
        await sharedPreferenceHelper().saveUserEmail(emailController.text);
        await sharedPreferenceHelper().saveUserId(Id);
        await sharedPreferenceHelper().saveUserName(nameController.text);
        await sharedPreferenceHelper().saveUserImage("https://firebasestorage.googleapis.com/v0/b/barberapp-ebcc1.appspot.com/o/icon1.png?alt=media&token=0fad24a5-a01b-4d67-b4a0-676fbc75b34a");
        //cloud database
        Map<String, dynamic> userInfoMap = {
          "Name": nameController.text,
          "Email": emailController.text,
          "Id": Id,
          "Image":
              "https://firebasestorage.googleapis.com/v0/b/barberapp-ebcc1.appspot.com/o/icon1.png?alt=media&token=0fad24a5-a01b-4d67-b4a0-676fbc75b34a"
        };
        // upload data to the firebase database
        await DatabaseMethods().addUserDetails(userInfoMap, Id);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ButtonNav()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "password provided is too weak",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Account Already exits",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )));
        }
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
                Image.asset("images/signup.png"),
                Text(
                  "Sign up",
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
                  "Name ",
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
                        return "Please Enter your name";
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter Your Name"),
                  ),
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
                        return "Please Enter your Email";
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
                    obscureText: true, //* for password hide text
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
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        name = nameController.text;
                        email = emailController.text;
                        password = passwordController.text;
                      });
                      registration();
                    }
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
                          "SIGNUP",
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
                      "Already have an accout? ",
                      style: AppWidget.lightTextFeildStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      child: Text(
                        "LogIn",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 15.0,
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
