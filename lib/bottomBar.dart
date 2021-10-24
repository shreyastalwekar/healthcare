import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'homepage.dart';
import 'map.dart';
import 'maindrawer.dart';

import 'News.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int page = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Health Care",
          style: TextStyle(fontSize: 22, fontFamily: 'Lobster'),
        ),
      ),
      drawer: MainDrawer(),
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        items: [
          Icon(Entypo.news, size: 27),
          Icon(
            FontAwesome.home,
            color: Colors.pink,
            size: 40.0,
          ),
          Icon(Entypo.globe, size: 27)
        ],
        height: 55,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.grey.shade300,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 200),
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: getPage(page),
    );
  }

  getPage(int cpage) {
    switch (cpage) {
      case 0:
        return News();
      case 1:
        return HomePage();
      case 2:
        return MapSample();
    }
  }
}
