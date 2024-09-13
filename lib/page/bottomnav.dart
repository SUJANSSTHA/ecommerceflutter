import 'package:ecommerceflutter/page/Order.dart';
import 'package:ecommerceflutter/page/home.dart';
import 'package:ecommerceflutter/page/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ButtonNav extends StatefulWidget {
  const ButtonNav({super.key});

  @override
  State<ButtonNav> createState() => _ButtonNavState();
}

class _ButtonNavState extends State<ButtonNav> {
  late List<Widget> pages;

//* calling 3 pages -> Home, Order, Profile;
  late Home Homepage;
  late Order order;
  late Profile profile;
  int currentTabIndex = 0; //! for the user which nav. is tab

  @override
  void initState() {
    // TODO: implement initState
    Homepage = Home();
    order = Order();
    profile = Profile();
    pages = [
      Homepage,
      order,
      profile
    ]; //! this will show accroding in order in navigation var
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65.0,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(microseconds: 5000),


        onTap: (int index){
          setState(() {
            currentTabIndex=index;
          });
        },
        items: [
        Icon(
          Icons.home_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.person_outlined,
          color: Colors.white,
        ),
      ]),
      body:pages[currentTabIndex],
    );
  }
}
