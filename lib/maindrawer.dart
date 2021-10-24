import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motorgarage/xray.dart';
import 'AboutUs.dart';
import 'cooupons.dart';
import 'feedback.dart';
import 'loginpage.dart';
import 'pastAppointment.dart';
import 'package:url_launcher/url_launcher.dart';
import 'myinvoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'faqs.dart';
import 'bottomBar.dart';
import 'contact.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      Container(
        height: 210.0,
        child: DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Colors.teal[200],
            Colors.teal, // shadowColor: Color(0xff225643),
            Colors.teal[700],
          ])),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(right: 100, left: 20),
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
                    padding: EdgeInsets.only(top: 4, left: 8),
                    child: Text(
                      'Hello Shreyas',
                      //'Hello, $firstName',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: Text(
                      'shreyashtalwekar001@gmail.com',
                      //'$email',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          decoration: TextDecoration.underline),
                    )),
              ],
            ),
          ),
        ),
      ),
      ListTile(
        leading: IconButton(
          icon: Icon(Icons.home),
          iconSize: 24,
          onPressed: () {},
        ),
        title: Text('Home'),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigation()),
          );
        },
      ),
      ListTile(
        leading: IconButton(
          icon: Icon(Icons.home),
          iconSize: 24,
          onPressed: () {},
        ),
        title: Text('Covid Detector'),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetectMain()),
          );
        },
      ),
      ListTile(
        leading: IconButton(
          icon: Icon(Icons.calendar_today),
          iconSize: 24,
          onPressed: () {},
        ),
        title: Text('My Appointment'),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PastAppointment()),
          );
        },
      ),
      ListTile(
        leading: IconButton(
          icon: Icon(Icons.receipt),
          iconSize: 24,
          onPressed: () {},
        ),
        title: Text('My Invoices'),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Myinvoices()),
          );
        },
      ),
      ListTile(
        leading: IconButton(
          icon: Icon(Icons.card_giftcard),
          iconSize: 24,
          onPressed: () {},
        ),
        title: Text(
          'My Coupons',
        ),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyCoupons()),
          );
        },
      ),
      Divider(height: 1, thickness: 0.5, color: Colors.blueGrey),
      ListTile(
        leading: IconButton(
          icon: Icon(Icons.contacts),
          iconSize: 24,
          onPressed: () {},
        ),
        title: Text('Contact Us'),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactUs()),
          );
        },
      ),
      ListTile(
        leading: IconButton(
          icon: Icon(Icons.feedback),
          iconSize: 24,
          onPressed: () {},
        ),
        title: Text('Feedback'),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Feedbacck()),
          );
        },
      ),
      ListTile(
        leading: IconButton(
          icon: Icon(Icons.question_answer),
          iconSize: 24,
          onPressed: () {},
        ),
        title: Text('FAQs'),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FAQs()),
          );
        },
      ),
      Divider(height: 1, thickness: 0.5, color: Colors.blueGrey),
      ListTile(
        leading: IconButton(
          icon: Icon(Icons.lock),
          iconSize: 24,
          onPressed: () {},
        ),
        title: Text('Logout'),
        onTap: () async {
          Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) => AuthPagee()),
            (_) => false,
          );
        },
      ),
      Divider(height: 1, thickness: 0.5, color: Colors.blueGrey),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Padding(
          //   padding: EdgeInsets.only(left: 0),
          // ),
          IconButton(
              color: Colors.blue,
              icon: Icon(FontAwesomeIcons.facebook),
              iconSize: 35,
              onPressed: () //async
                  {}),
          IconButton(
            color: Colors.redAccent,
            icon: Icon(FontAwesomeIcons.instagram),
            iconSize: 35,
            onPressed: () async {
              var url = 'https://www.instagram.com/shreyastalwekar/';

              if (await canLaunch(url)) {
                launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          IconButton(
              color: Colors.blue,
              icon: Icon(FontAwesomeIcons.twitter),
              iconSize: 35,
              onPressed: () //async
                  {})
        ],
      ),
      SizedBox(
        height: 15,
      )
    ]));
  }
}

class AuthService with ChangeNotifier {
  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    notifyListeners();
    return result;
  }
}
