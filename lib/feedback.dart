import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'maindrawer.dart';

class Feedbacck extends StatefulWidget {
  @override
  _FeedbacckState createState() => _FeedbacckState();
}

class _FeedbacckState extends State<Feedbacck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //key: _scaffoldkey,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          toolbarHeight: 75,
          title: Text(
            '\t\t\tWrite Feedback',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'CreteRound',
                fontSize: 25.5),
          ),
        ),
        drawer: MainDrawer(),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.93),
        body: ListView(children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                    height: 270,
                    margin: EdgeInsets.only(top: 0),
                    child: Image(
                      image: AssetImage('lib/assets/feedback.png'),
                    )),
                Feedbackk()
              ],
            ),
          ),
        ]));
  }
}

class Feedbackk extends StatefulWidget {
  Feedbackk({Key key}) : super(key: key);

  @override
  _FeedbackkState createState() => _FeedbackkState();
}

class _FeedbackkState extends State<Feedbackk> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  List category;
  double _ratingValue;
  ValueChanged _onChanged = (val) => print(val);

  final dbRef = FirebaseDatabase.instance.reference().child("feedback");
  var firebaseUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: TextFormField(
              maxLines: 7,
              controller: nameController,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                // icon: Icon(
                //   Icons.account_circle,
                //   color: Colors.teal,
                // ),
                //labelText: 'Full Name',
                hintText: 'Say what you think about the App',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Valid feedback';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: FormBuilderFilterChip(
              //onChanged: _onChanged,
              selectedColor: Colors.green,

              spacing: 35,
              showCheckmark: false,
              //decoration: InputDecoration(),
              options: [
                FormBuilderFieldOption(
                    value: 'Suggestion',
                    child: Text(
                      'Suggestion',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    )),
                FormBuilderFieldOption(
                    value: 'Bug',
                    child: Text('Bug',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18))),
                FormBuilderFieldOption(
                    value: 'Other',
                    child: Text('Other',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18))),
              ],

              onChanged: (value) {
                setState(() {
                  category = value;
                });
              },

              attribute: 'Service',
            ),
          ),
          Text('  How was your Experience with us ?',
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 7),
            child: RatingBar(
                itemSize: 50,
                glowColor: Colors.amber,
                initialRating: 0.0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                    full: Icon(Icons.star, color: Colors.orange, size: 32),
                    half: Icon(
                      Icons.star_half,
                      color: Colors.orange[800],
                      size: 32,
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
          Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Colors.pink,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          dbRef.push().set({
                            "name": nameController.text,
                            "rating": _ratingValue,
                            "type": category
                          }).then((_) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: ShapeBorder.lerp(null, null, 5),
                                    title: Text(
                                      "Submitted Successfully",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    content: Text("Thank you for Feedback"),
                                    actions: [
                                      FlatButton(
                                        child: Text("Ok"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                });
                            nameController.clear();
                          }).catchError((onError) {
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text(onError)));
                          });
                        }
                      },
                      child: Text(
                        'Submit Feedback',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  ),
                ],
              )),
        ])));
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }
}
