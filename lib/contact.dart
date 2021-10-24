import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:motorgarage/Askus.dart';
import 'maindrawer.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              //showSearch(context: context, delegate: DataNotification());
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Column(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  elevation: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'lib/assets/contactus.jpg',
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      //borderRadius: BorderRadius.circular(100),
                      ),
                  color: Colors.white,
                  elevation: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.touch_app,
                          color: Colors.black87,
                        ),
                        title: Text('Get in Touch',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AskUs()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(100),
                      ),
                  color: Colors.white,
                  elevation: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.call, color: Colors.blue[700]),
                        title: Text('Phone',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                        subtitle: Text('+91 7028003893',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800)),
                        onTap: () async {
                          var url = 'tel:7028003893';

                          if (await canLaunch(url)) {
                            launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(100),
                      ),
                  color: Colors.white,
                  elevation: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.email, color: Colors.red[700]),
                        title: Text('Email',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                        subtitle: Text('shreyashtalwekar001@gmail.com',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800)),
                        onTap: () async {
                          var url2 = 'mailto:shreyashtalwekar001@gmail.com';

                          if (await canLaunch(url2)) {
                            launch(url2);
                          } else {
                            throw 'Could not launch $url2';
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(100),
                      ),
                  color: Colors.white,
                  elevation: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.location_pin, color: Colors.green),
                        title: Text('Location',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                        subtitle: Text('Chimur-442903 \nMaharashtra',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800)),
                        onTap: () async {
                          var url2 = 'geo:20.4952,79.3719';

                          if (await canLaunch(url2)) {
                            launch(url2);
                          } else {
                            throw 'Could not launch $url2';
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
