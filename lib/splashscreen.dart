import 'dart:async';
import 'package:motorgarage/loginpage.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AuthPagee()),
      ),
    );
  }

  Color gradientStart = Colors.transparent;
  Color gradientEnd = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [gradientStart, gradientEnd],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(0, 1.8),
            stops: [0.0, 2.0],
            tileMode: TileMode.clamp),
      ),
      // image: DecorationImage(
      //   image: AssetImage("lib/assets/greey.png"),
      //   fit: BoxFit.cover,
      // ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.only(right: 100, left: 90),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                'https://content.presentermedia.com/files/clipart/00001000/1783/blue_medical_symbol_pc_800_wht.jpg',
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'Health Care',
                          style: TextStyle(
                            fontFamily: 'CreteRound',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
