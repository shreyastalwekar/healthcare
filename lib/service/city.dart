import 'package:flutter/material.dart';
import 'package:motorgarage/service/hoospital.dart';
import 'package:motorgarage/bookappointment.dart';

import 'doctor.dart';
import 'hoospitalkol.dart';

class Physician extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Please Select City",
          style: TextStyle(fontSize: 22),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(
                height: 0.5,
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextFormField(
                  //controller: nameController,
                  decoration: const InputDecoration(
                    //border: OutlineInputBorder(),
                    icon: Icon(
                      Icons.search,
                      color: Colors.teal,
                      size: 35,
                    ),
                    labelText: 'Search',
                    hintText: 'Search for Your City',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Valid Name';
                    }
                    return null;
                  },
                ),
              ),
              // Divider(
              //   thickness: 15,
              //   indent: 35,
              //   endIndent: 35,
              // ),

              Padding(
                padding: EdgeInsets.only(top: 10, left: 100),
                child: Text(
                  "Major Cities",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.0, vertical: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Hospital(),
                                  ),
                                );
                              },
                              child: new CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                backgroundImage: new NetworkImage(
                                  "https://i.pinimg.com/originals/af/23/dd/af23dd03798ec42de3e1c950d30b7c8d.png",
                                  //fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text('Mumbai',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Hospitalkol(),
                                  ),
                                );
                              },
                              child: new CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                backgroundImage: new NetworkImage(
                                  "https://i.pinimg.com/originals/04/56/1f/04561f93dbd46a3847fc078d014941cf.png",
                                  //fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text('Kolkata',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.0, vertical: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Physician(),
                                  ),
                                );
                              },
                              child: new CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                backgroundImage: new NetworkImage(
                                  "https://cdn.dribbble.com/users/843980/screenshots/3253473/hyderabad.png?compress=1&resize=400x300",
                                  //fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text('Hyderabad',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => Brakerepair(),
                                //   ),
                                // );
                              },
                              child: new CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                backgroundImage: new NetworkImage(
                                  "https://apprecs.org/gp/images/app-icons/300/69/com.bangaloreway.jpg",
                                  //fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text('Benglauru',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.0, vertical: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Physician(),
                                  ),
                                );
                              },
                              child: new CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                backgroundImage: new NetworkImage(
                                  "https://www.sergeantpaper.com/content/uploads/Taj-Mahal.jpg",
                                  //fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text('Agra',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => Brakerepair(),
                                //   ),
                                // );
                              },
                              child: new CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                backgroundImage: new NetworkImage(
                                  "https://cdn.iconscout.com/icon/free/png-256/delhi-gate-red-fort-lahori-fifth-mughal-emperor-mughal-21989.png",
                                  //fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text('Delhi',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
