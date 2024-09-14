import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef5f1),
      body: Container(
        // Icon(Icons.arrow_back),
        padding: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
              Center(
                  child: Image.asset(
                "images/headphone2.png",
                height: 400,
              )),
            ]),
            Container(
              decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft:Radius.circular(20),topRight: Radius.circular(20),
                 )),
              width: MediaQuery.of(context).size.width,
            ),
       
          ],
        ),
      ),
    );
  }
}
