import 'package:ecommerceflutter/page/login.dart';
import 'package:ecommerceflutter/widget/support_widget.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin:
            EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 40.0),
        child: SingleChildScrollView(
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
                child: TextField(
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
                child: TextField(
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
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Your Password"),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text(
              //       "Forgot Password?",
              //       style: TextStyle(
              //           color: Colors.green,
              //           fontSize: 10.0,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 10.0,
              ),
              Center(
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
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
    );
  }
}