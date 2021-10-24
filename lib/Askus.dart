import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:motorgarage/contact.dart';

class AskUs extends StatefulWidget {
  @override
  _AskUsState createState() => _AskUsState();
}

class _AskUsState extends State<AskUs> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  //final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final detailController = TextEditingController();
  String category = 'Email';

  final dbRef = FirebaseDatabase.instance.reference().child("Get in touch");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldkey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactUs()),
            );
          },
        ),
        title: Text('Get in Touch'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.touch_app),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 0),
              child: Stack(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    //elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            'lib/assets/getin.jpg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 3.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    FormBuilder(
                        key: _fbKey,
                        // autovalidate: false,
                        child: Column(
                          children: <Widget>[
                            FormBuilderTextField(
                              attribute: "Name",
                              decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.teal,
                                ),
                                hintText: 'Enter your name',
                                labelText: 'Name',
                              ),
                              validators: [FormBuilderValidators.required()],
                              keyboardType: TextInputType.text,
                              controller: nameController,
                            ),
                            FormBuilderTextField(
                              attribute: "phoneNo",
                              decoration: InputDecoration(
                                prefixText: '+91 ',
                                icon: Icon(Icons.phone, color: Colors.teal),
                                labelText: 'Mobile No',
                              ),
                              maxLength: 10,
                              validators: [FormBuilderValidators.required()],
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                            ),
                            FormBuilderTextField(
                                attribute: "email",
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.teal,
                                  ),
                                  hintText: 'Enter a email address',
                                  labelText: 'Email',
                                ),
                                validators: [
                                  FormBuilderValidators.email(),
                                  FormBuilderValidators.required()
                                ],
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController),
                            SizedBox(height: 30.0),
                            FormBuilderRadioGroup(
                              activeColor: Colors.pink[600],
                              // orientation: GroupedRadioOrientation.wrap,
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                  labelText:
                                      'Preffered Method for Communication'),
                              attribute: 'Vehicle Category',
                              options: ['Phone', 'Email']
                                      //value=options,
                                      .map((String category) =>
                                          FormBuilderFieldOption(
                                            value: category,
                                          ))
                                      ?.toList() ??
                                  [],
                              onChanged: (value) {
                                setState(() {
                                  category = value;
                                });
                              },
                            ),
                            SizedBox(height: 30.0),
                            FormBuilderTextField(
                              attribute: "details",
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff225643),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff225643),
                                  ),
                                ),
                                hintText: 'Enter your quries',
                                labelText: 'Details',
                              ),
                              maxLines: 5,
                              validators: [FormBuilderValidators.required()],
                              keyboardType: TextInputType.text,
                              controller: detailController,
                            ),
                            SizedBox(height: 30.0),
                            SizedBox(
                              height: 40,
                              width: 500,
                              child: RaisedButton(
                                color: Colors.teal[600],
                                textColor: Colors.white,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text("Submit"),
                                onPressed: () {
                                  if (_fbKey.currentState.validate()) {
                                    dbRef.push().set({
                                      "name": nameController.text,
                                      "phone": phoneController.text,
                                      "email": emailController.text,
                                      "detail": detailController.text,
                                      "preffered method": category
                                    }).then((_) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              shape: ShapeBorder.lerp(
                                                  null, null, 5),
                                              title: Text(
                                                "Submitted Successfully",
                                                style: TextStyle(
                                                    color: Colors.red[800]),
                                              ),
                                              content: Text(
                                                "We will Contact you Shortly!!!\nThank You.",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
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
                                      detailController.clear();
                                      emailController.clear();
                                      phoneController.clear();
                                    }).catchError((onError) {
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(content: Text(onError)));
                                    });
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
