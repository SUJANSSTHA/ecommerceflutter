import 'package:ecommerceflutter/Admin/home_admin.dart';
import 'package:ecommerceflutter/widget/support_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
//! by this controller we can easily controll the text field
  TextEditingController nameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                "Admin Panel",
                style: AppWidget.seamiboldTextFeildStyle(),
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
                  controller: nameController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Enter Your Name"),
                ),
              ),
              SizedBox(
                height: 20.0,
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

                  controller: passwordController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Your Password"),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              GestureDetector(
                onTap: () {
                  loginAdmin();
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
            ],
          ),
        ),
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['username'] != nameController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                "Your id is not correct",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )));
        }else if(result.data()['password']!=passwordController.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Your password is not correct",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )));

        }else {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeAdmin()));
        }
        ;
      });
    });
  }
  // loginAdmin({
  //   FirebaseFirestore.instance.collection()
  // })
}
