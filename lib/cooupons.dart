import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'maindrawer.dart';

class MyCoupons extends StatefulWidget {
  MyCoupons({Key key}) : super(key: key);

  @override
  _MyCouponsState createState() => _MyCouponsState();
}

class _MyCouponsState extends State<MyCoupons> {
  final dbRef = FirebaseDatabase.instance.reference().child("coupons");
  List<Map<dynamic, dynamic>> lists = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal,
          title: Text('My Coupons'),
        ),
        drawer: MainDrawer(),
        backgroundColor: Color.fromRGBO(225, 225, 225, 1),
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
                    shrinkWrap: true,
                    itemCount: lists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.only(top: 5),
                        height: 159.0,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.only(left: 5, top: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          child: SafeArea(
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 30,
                                      width: 310,
                                      //color: Colors.black,
                                      child: Text(
                                        lists[index]["heading"],
                                        style: TextStyle(
                                            color: Colors.green[700],
                                            fontSize: 16.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: 310,
                                      //color: Colors.black,
                                      child: Text(
                                        lists[index]["subheading"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.5,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 310,
                                      //color: Colors.black,
                                      child: Text(
                                        lists[index]["date"],
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 13,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 28,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 29,
                                          right: 0,
                                          left: 2,
                                          bottom: 2),
                                      child: Container(
                                        height: 20,
                                        width: 10,
                                        //color: Colors.amber,
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Colors.pink,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2, right: 2, left: 0, bottom: 2),
                                      child: Container(
                                        height: 40,
                                        width: 70,
                                        //color: Colors.amber,
                                        child: Text(
                                          'View T&C',
                                          style: TextStyle(
                                              color: Colors.pink,
                                              fontSize: 12.5,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
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
