import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter/rendering.dart';
import 'maindrawer.dart';

class Myinvoices extends StatefulWidget {
  Myinvoices({Key key}) : super(key: key);

  @override
  _MyinvoicesState createState() => _MyinvoicesState();
}

final dbRef = FirebaseDatabase.instance.reference().child("myappointment");

List<Map<dynamic, dynamic>> lists = [];

class _MyinvoicesState extends State<Myinvoices> {
  double _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: Text('My Invoices'),
        ),
        drawer: MainDrawer(),
        body: FutureBuilder(
            future: dbRef.once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                lists.clear();
                Map<dynamic, dynamic> values = snapshot.data.value;
                values.forEach((key, values) {
                  lists.add(values);
                });
                return new ListView.builder(
                    itemCount: lists.length,
                    primary: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    //physics: ScrollPhysics(),
                    //shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ExpansionTile(
                          backgroundColor: Colors.teal[50],

                          title: Container(
                            margin: const EdgeInsets.only(
                                left: 0.0, right: 0.0, top: 0),
                            padding: EdgeInsets.all(0),
                            //height: 355,
                            // width: 400,
                            //color: Colors.blueAccent,
                            child: Material(
                              elevation: 5.0,
                              child: Container(
                                //color: Colors.amber,
                                padding: EdgeInsets.all(10.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AppBar(
                                        automaticallyImplyLeading: false,
                                        toolbarHeight: 45,
                                        backgroundColor: Colors.pink,
                                        // leading: Icon(
                                        //   Icons.search,
                                        //   size: 9,
                                        // ),
                                        title: Text(
                                            "Invoice Number :" +
                                                lists[index]["invoiceid"],
                                            style: TextStyle(fontSize: 19)),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.assignment_ind,
                                                color: Color(0xff225643)),
                                            SizedBox(width: 10),
                                            Text(
                                              'Booking ID :' +
                                                  lists[index]["bookingID"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 7),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.calendar_today,
                                                color: Color(0xff225643)),
                                            SizedBox(width: 10),
                                            Text(
                                              "Date : " +
                                                  lists[index]
                                                      ["appointmentDate"],
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 7),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.lock_clock,
                                                color: Color(0xff225643)),
                                            SizedBox(width: 10),
                                            Text(
                                              "Time: " +
                                                  lists[index]
                                                      ["appointmentTime"],
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 45),
                                    child: Row(
                                      children: <Widget>[
                                        // Icon(Icons.calendar_today,
                                        //     color: Color(0xff225643)),
                                        SizedBox(width: 10),
                                        Text(
                                          "General Fees         :",
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          lists[index]["Total parts"],
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 45),
                                    child: Row(
                                      children: <Widget>[
                                        // Icon(Icons.calendar_today,
                                        //     color: Color(0xff225643)),
                                        SizedBox(width: 10),
                                        Text(
                                          "Test Charges         :",
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          lists[index]["labour"],
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    indent: 20,
                                    endIndent: 20,
                                    thickness: 2.0,
                                    height: 1.0,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 45),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Text(
                                          "Total                        :",
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          lists[index]["total"],
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 7),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Text(
                                          "Payment Status : ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          lists[index]["payment"],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 7),
                                    child: RatingBar(
                                        initialRating: 0.0,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        ratingWidget: RatingWidget(
                                            full: Icon(Icons.star,
                                                color: Colors.orange),
                                            half: Icon(
                                              Icons.star_half,
                                              color: Colors.orange[800],
                                            ),
                                            empty: Icon(
                                              Icons.star_outline,
                                              color: Colors.orange,
                                            )),
                                        onRatingUpdate: (value) {
                                          setState(() {
                                            _ratingValue = value;
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceAround,
                              buttonHeight: 52.0,
                              buttonMinWidth: 90.0,
                              children: <Widget>[
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  onPressed: () {
                                    // _imageFile = null;
                                    // screenshotController
                                    //     .capture()
                                    //     .then((Uint8List image) async {
                                    //   //print("Capture Done");
                                    //   setState(() {
                                    //     _imageFile = image;
                                    //   });
                                    //   final result =
                                    //       await ImageGallerySaver.saveImage(
                                    //           image); // Save image to gallery,  Needs plugin  https://pub.dev/packages/image_gallery_saver
                                    //   print("File Saved to Gallery");
                                    // }).catchError((onError) {
                                    //   print(onError);
                                    // });
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.download_sharp),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                      ),
                                      Text('Download'),
                                    ],
                                  ),
                                ),
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  onPressed: () {
                                    //cardA.currentState?.collapse();
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.arrow_upward),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                      ),
                                      Text('Close'),
                                    ],
                                  ),
                                ),
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  onPressed: () {},
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.share),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                      ),
                                      Text('Share'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
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
            }));
  }
}
