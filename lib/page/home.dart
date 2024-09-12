import 'package:ecommerceflutter/widget/support_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories = [
    "images/headphone_icon.png",
    "images/laptop.png",
    "images/watch.png",
    "images/TV.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xf2f2f2f2),
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey,Sujan",
                      style: AppWidget.bolTextFeildStyle(),
                    ),
                    Text(
                      "Good Morning",
                      style: AppWidget.lightTextFeildStyle(),
                    ),
                  ],
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "images/boy.jpg",
                      height: 70.0,
                      width: 70.0,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
                // padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                //* this MediaQuery.of(context).size that it can use complete widget of the screen
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Products",
                      hintStyle: AppWidget.lightTextFeildStyle(),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                )),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: AppWidget.seamiboldTextFeildStyle(),
                ),
                Text(
                  "Sea all",
                  style: TextStyle(
                    color: Color(0xFFfd6f3e),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Container(
                  height: 130.0,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFfd6f3e)),
                    // height: 90,
                    // width: 90,
                    child: Center(
                      child: Text(
                        "All",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Expanded(
                  child: Container(
                    // margin: EdgeInsets.only(left: 20.0),
                    height: 130.0,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(image: categories[index]);
                        }),
                  ),
                ),
              ],
            ),
            ListView(
              children: [
                Container(
                  child: 
                  Image.asset("images/headphone2.png"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  // const CategoryTile({super.key});
  String image;
  CategoryTile({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      height: 90,
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            height: 50,
            fit: BoxFit.cover,
          ),
          // SizedBox(height: 10.0,),
          Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}
