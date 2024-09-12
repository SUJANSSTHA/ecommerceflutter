import 'package:flutter/material.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffecefeB),
        body: Container(
          margin: EdgeInsets.only(
            top: 50.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("images/headphone.PNG"),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Explore\nThe Best\nProducts",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: (FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle
                      // borderRadius: BorderRadius.circular(120.0)
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 245, 245, 245),
                        fontSize: 20.0,
                        fontWeight: (FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
