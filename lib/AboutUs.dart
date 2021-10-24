import 'package:flutter/material.dart';
import 'maindrawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      drawer: MainDrawer(),
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
                        'https://thumbs.dreamstime.com/b/auto-mechanic-s-tools-grey-background-space-text-auto-mechanic-s-tools-grey-background-flat-lay-space-text-168999424.jpg'),
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
                                    "Shreyas Talwekar",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Student"),
                                    subtitle: Text("VIT Pune"),
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
                                      Text("GR.No",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text("11910658")
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text("Year",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text("S.Y")
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text("Department",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text("Entc-D")
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
                                    'https://i.pinimg.com/736x/13/48/4b/13484b5cc4b4e8f6638a1357dab4fb1d.jpg'),
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
                        ListTile(
                          title: Text("Project Information"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Title"),
                          subtitle: Text("Software Development Project",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          leading: Icon(FontAwesomeIcons.cogs),
                        ),
                        ListTile(
                          title: Text("Project Title"),
                          subtitle: Text(
                            "Motor Garage",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          leading: Icon(FontAwesomeIcons.cog),
                        ),
                        ListTile(
                          title: Text("Academic Year"),
                          subtitle: Text("2020-21"),
                          leading: Icon(FontAwesomeIcons.calendar),
                        ),
                        ListTile(
                          title: Text("Guided by"),
                          subtitle: Text("Dr. Ashutosh Marathe"),
                          leading: Icon(Icons.web),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("Student Information"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Email"),
                          subtitle: Text("shreyashtalwekar001@gmail.com"),
                          leading: Icon(Icons.email),
                        ),
                        ListTile(
                          title: Text("Phone"),
                          subtitle: Text("+91-7028003893"),
                          leading: Icon(Icons.phone),
                        ),
                        ListTile(
                          title: Text("About"),
                          subtitle: Text(
                              "Motor Garage is android application that help used to find the best service centre for there vehicle service .This app will help billions of people to keep there car in good condition and working shape. Also will help people to solve problems and issues they have encountered while driving or just sitting in one area. This app will be the next generation in car maintenance and will help solve any car issue that is out there."),
                          leading: Icon(Icons.person),
                        ),
                      ],
                    ),
                  )
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
