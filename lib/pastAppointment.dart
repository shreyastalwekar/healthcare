import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'maindrawer.dart';

class PastAppointment extends StatefulWidget {
  PastAppointment({Key key}) : super(key: key);

  @override
  _PastAppointmentState createState() => _PastAppointmentState();
}

List<Map<dynamic, dynamic>> lists = [];

final dbRef = FirebaseDatabase.instance.reference().child("myappointment");

class _PastAppointmentState extends State<PastAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal,
          title: Text('My Appointments'),
        ),
        drawer: MainDrawer(),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            NullThrownError == null
                ? Container(
                    child: Text("nodata"),
                  )
                : FutureBuilder(
                    future:
                        dbRef.orderByChild('bookingID').limitToFirst(10).once(),
                    builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        lists.clear();
                        Map<dynamic, dynamic> values = snapshot.data.value;
                        values.forEach((key, values) {
                          lists.add(values);
                        });
                        return new ListView.builder(
                            shrinkWrap: true,
                            itemCount: lists.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SingleChildScrollView(
                                  child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 8),
                                padding: EdgeInsets.all(8),
                                //height: 400,
                                width: 490,
                                //color: Colors.blueAccent,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      height: 100,
                                      width: 390,
                                      child: Image.asset(
                                          'lib/assets/doctor.png',
                                          fit: BoxFit.fill),
                                    ),
                                    Column(children: <Widget>[
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 20, 0, 0)),
                                      SizedBox(height: 0),
                                      Container(
                                        padding: EdgeInsets.all(20.0),
                                        child: Material(
                                          elevation: 5.0,
                                          child: Container(
                                            //padding: EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                AppBar(
                                                  backgroundColor:
                                                      Colors.teal[700],
                                                  leading: Icon(
                                                    Icons.directions_car,
                                                    size: 22,
                                                  ),
                                                  title: Text("Doctor : " +
                                                      lists[index]["service"]),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'Booking ID : ' +
                                                            lists[index]
                                                                ["bookingID"],
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child:
                                                      Wrap(children: <Widget>[
                                                    Text(
                                                      "City: " +
                                                          lists[index]
                                                              ["ServiceArea"],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child:
                                                      Wrap(children: <Widget>[
                                                    Text(
                                                      "Past Disease : " +
                                                          lists[index]
                                                              ["category"],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Row(children: <Widget>[
                                                    Text(
                                                      "Symptoms : " +
                                                          lists[index]
                                                              ["health"],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 7),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        "Date : " +
                                                            lists[index][
                                                                "appointmentDate"],
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        "Time : " +
                                                            lists[index][
                                                                "appointmentTime"],
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 7,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Text(
                                                        'Status : ' +
                                                            lists[index]
                                                                ["status"],
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 0),
                                                      child: IconButton(
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                          ),
                                                          onPressed:
                                                              () async {}),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Divider(
                                      //   thickness: 2,
                                      //   indent: 35,
                                      //   endIndent: 35,
                                      // ),
                                      // Container(
                                      //   padding: EdgeInsets.all(1.0),
                                      //   child: Column(
                                      //     crossAxisAlignment: CrossAxisAlignment.center,
                                      //     children: <Widget>[
                                      //       Align(
                                      //         alignment: Alignment.bottomCenter,
                                      //         child: RaisedButton.icon(
                                      //             color: Colors.blue,
                                      //             textColor: Colors.white,
                                      //             icon: Icon(Icons.phone),
                                      //             label: Text("Emergency Contact"),
                                      //             onPressed: () async {
                                      //               var url = 'tel:18001030000';

                                      //               if (await canLaunch(url)) {
                                      //                 launch(url);
                                      //               } else {
                                      //                 throw 'Could not launch $url';
                                      //               }
                                      //             }),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // )
                                    ])
                                  ],
                                ),
                              ));
                            });
                      }
                      return Container(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                child: CircularProgressIndicator(
                                  strokeWidth: 7.0,
                                ),
                                height: 50.0,
                                width: 50.0,
                              )
                            ],
                          ),
                        ),
                      );
                    })
          ],
        ));
  }
}
