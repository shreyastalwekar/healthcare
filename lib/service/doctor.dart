import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bookappointment.dart';

class DoctorsInfo extends StatefulWidget {
  @override
  _DoctorsInfoState createState() => _DoctorsInfoState();
}

class _DoctorsInfoState extends State<DoctorsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  //color: Colors.teal[800],
                  borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://image.shutterstock.com/image-photo/modern-hospital-style-building-260nw-212251981.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 150.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 33.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Dr. Albert Anthanoy",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Physician",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      IconButton(
                                          color: Colors.blue[500],
                                          onPressed: () async {
                                            var url = 'tel:7028003893';

                                            if (await canLaunch(url)) {
                                              launch(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          icon:
                                              Icon(FontAwesomeIcons.phoneAlt)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      IconButton(
                                          color: Colors.red[500],
                                          onPressed: () async {
                                            var url2 =
                                                'mailto:shreyashtalwekar001@gmail.com';

                                            if (await canLaunch(url2)) {
                                              launch(url2);
                                            } else {
                                              throw 'Could not launch $url2';
                                            }
                                          },
                                          icon:
                                              Icon(FontAwesomeIcons.mailBulk)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      IconButton(
                                          color: Colors.green[500],
                                          onPressed: () async {
                                            var url2 = 'geo:20.4952,79.3719';

                                            if (await canLaunch(url2)) {
                                              launch(url2);
                                            } else {
                                              throw 'Could not launch $url2';
                                            }
                                          },
                                          icon: Icon(
                                              FontAwesomeIcons.locationArrow)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn.sanity.io/images/0vv8moc6/hcplive/0ebb6a8f0c2850697532805d09d4ff10e838a74b-200x200.jpg'),
                                fit: BoxFit.cover)),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                          title: Text("About"),
                          subtitle: Text(
                              "Dr. Albert Anthanoy is an MBBS and MD from AIIMS Delhi and diagnose and treat illness and injury. He had served for more than 30years",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          leading: Icon(FontAwesomeIcons.cogs),
                        ),
                        ListTile(
                          title: Text("Open Hours - Close Hours"),
                          subtitle: Text(
                            "09:00 AM - 10:00 OM",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red[700]),
                          ),
                          leading: Icon(FontAwesomeIcons.businessTime),
                        ),
                        ListTile(
                          title: Text("Address"),
                          subtitle: Text(
                              "Bhande layout Besides , Nagraj Apartment , 448902 Nagpur"),
                          leading: Icon(FontAwesomeIcons.searchLocation),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.teal,
                      height: 55,
                      width: 400,
                      child: RaisedButton(
                        color: Colors.teal,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Appointment(),
                            ),
                          );
                        },
                        child: Text(
                          'Book Your Appointment',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CreteRound'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}
