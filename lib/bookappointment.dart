import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'dart:async';

import 'package:intl/intl.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //key: _scaffoldkey,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Appointment'),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, .9),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    //clipper: CustomShapeClipper(),
                    child: Container(
                      margin: EdgeInsets.all(0),
                      height: 310.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0.0, 3.0),
                                blurRadius: 15.0)
                          ],
                          color: Colors.teal[200]),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          height: 170,
                          margin: EdgeInsets.only(top: 25),
                          child: CircleAvatar(
                            radius: 90,
                            backgroundColor: Colors.white,
                            backgroundImage: new NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKeGwOlRhcZCd3LQz1Og4JygghjjqIQZljjw&usqp=CAU',
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 35, top: 4),
                      ),
                      Text(
                        "Book Your Appointment",
                        style: TextStyle(
                            fontFamily: 'CreteRound',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7),
                        child: Text(
                          "Take care of Your Health in best Hospital and Consults to our best Doctors",
                          style: TextStyle(
                              fontFamily: "Satisfy",
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Registration()
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class Registration extends StatefulWidget {
  Registration({Key key, this.uid}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
  final String uid;
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  final areaofservice = [
    'Kolkata',
    'Pune',
    'Mumbai',
    'Agra',
    'Delhi',
  ];
  String dropdownValue = 'Delhi';
  List serviceValue;
  String category = 'M';
  String dateofappointment;
  String timeofAppointment;
  DateTime selectedDate;
  DateTime selectedtime;
  String status = "Not approved";
  String bookingid = "";
  String parts = "";
  String labour = "";
  String total = "";
  String invoice = "";
  String payment = "Not Done";
  initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedtime = DateTime.now();
  }

  final format = DateFormat("dd-MM-yyyy");
  final formattime = DateFormat("HH:mm");
  final nameController = TextEditingController();
  final healthController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();

  final suggestionController = TextEditingController();
  ValueChanged _onChanged = (val) => print(val);
  // FirebaseUser currentUser;
  // bool selected = false;
  // //final dbRef = FirebaseDatabase.instance.reference().child("blooddonor");
  // Future<String> getData() async {
  //   final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  //   final String uid = user.uid.toString();
  //   return uid;
  // }

  // Future<DocumentSnapshot> getUser() async {
  //   final uid = await getData();
  //   return Firestore.instance.document("signup/$uid").get();
  // }
  final dbRef = FirebaseDatabase.instance.reference().child("myappointment");
  var firebaseUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          SizedBox(height: 20),
          Text('Please provide Details',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.teal,
                ),
                labelText: 'Full Name',
                hintText: 'Enter Your Full name',
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
          Text('Health Problem and Symptoms',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: DropdownButtonFormField(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ("City"),
                  //hintText: ("Hospital You are Willing to Donate Blood"),
                  icon: Icon(
                    Icons.local_hospital,
                    color: Colors.teal[400],
                  )),
              items: areaofservice.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Select ';
                }
                return null;
              },
            ),
          ),
          Text('Type of Doctor',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: FormBuilderFilterChip(
              //onChanged: _onChanged,
              selectedColor: Colors.greenAccent,
              decoration: InputDecoration(
                  // labelText: 'Select Services todo',
                  //style: TextStyle(fontWeight: FontWeight.w700)
                  ),
              options: [
                FormBuilderFieldOption(
                    value: 'Cardiologist',
                    child: Text(
                      'Cardiologist',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )),
                FormBuilderFieldOption(
                    value: 'Dentist',
                    child: Text('Dentist',
                        style: TextStyle(fontWeight: FontWeight.w700))),
                FormBuilderFieldOption(
                    value: 'Gynaecologist',
                    child: Text('Gynaecologist',
                        style: TextStyle(fontWeight: FontWeight.w700))),
                FormBuilderFieldOption(
                    value: 'Paediatrician',
                    child: Text('Paediatrician',
                        style: TextStyle(fontWeight: FontWeight.w700))),
                FormBuilderFieldOption(
                    value: 'Radiologist',
                    child: Text('Radiologist',
                        style: TextStyle(fontWeight: FontWeight.w700))),
                FormBuilderFieldOption(
                    value: 'Oncologist',
                    child: Text('Oncologist',
                        style: TextStyle(fontWeight: FontWeight.w700))),
                FormBuilderFieldOption(
                    value: 'Neurologist',
                    child: Text('Neurologist',
                        style: TextStyle(fontWeight: FontWeight.w700))),
                FormBuilderFieldOption(
                    value: 'Surgeon',
                    child: Text('Surgeon',
                        style: TextStyle(fontWeight: FontWeight.w700))),
                FormBuilderFieldOption(
                    value: 'General',
                    child: Text('General',
                        style: TextStyle(fontWeight: FontWeight.w700))),
              ],

              onChanged: (value) {
                setState(() {
                  serviceValue = value;
                });
              },
              // onChanged: (value) {
              //   setState(() {
              //     serviceValue = value;
              //   });
              // },
              attribute: 'Service',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextFormField(
              controller: healthController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.teal,
                ),
                labelText: 'Symptoms',
                hintText: 'Enter your Symptoms',
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
          Text('  Please provide Date and Time for',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
          Text(' Appointment',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: DateTimeField(
              format: format,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.teal,
                ),
                labelText: 'dd:MM:yyyy',
              ),
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2030));
              },
              onChanged: (date) {
                setState(() {
                  selectedDate = date;
                  dateofappointment = DateFormat.yMMMd().format(selectedDate);
                  print(dateofappointment);
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: DateTimeField(
              format: formattime,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(
                  Icons.access_time,
                  color: Colors.teal,
                ),
                labelText: 'Select time',
              ),
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.convert(time);
              },
              onChanged: (time) {
                setState(() {
                  selectedtime = time;
                  timeofAppointment = DateFormat.jm().format(selectedtime);
                  print(timeofAppointment);
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: FormBuilderRadioGroup(
              // orientation: GroupedRadioOrientation.wrap,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Past Disease'),
              attribute: 'Disease Category',
              options: ['Blood Pressure', 'Diabetes', 'Allergy', 'None']
                      //value=options,
                      .map((String category) => FormBuilderFieldOption(
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
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneController,

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                border: OutlineInputBorder(),
                prefixText: '+91 ',
                labelText: 'Phone Number',
              ),
              maxLength: 10,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Valid Phone number';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              controller: suggestionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Suggestions',
                //hintText: 'Current Address',
                // icon: Icon(
                //   Icons.add_location,
                //   color: Color.fromRGBO(255, 0, 0, 1),
                // ),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Enter Suggestion';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Text('Thank You',
                style: TextStyle(fontSize: 22, fontFamily: 'CreteRound')),
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Text('Please Visit Again !',
                style: TextStyle(fontSize: 22, fontFamily: 'CreteRound')),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: FormBuilderSwitch(
              label: Text('I Accept the tems and conditions',
                  style: TextStyle(fontSize: 15, fontFamily: 'CreteRound')),
              attribute: 'accept_terms_switch',
              initialValue: true,
              onChanged: _onChanged,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Colors.red,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          dbRef.push().set({
                            "name": nameController.text,
                            "health": healthController.text,
                            "ServiceArea": dropdownValue,
                            "mobile": phoneController.text,
                            "appointmentDate": dateofappointment,
                            "appointmentTime": timeofAppointment,
                            "category": category,
                            "suggestion": suggestionController.text,
                            "service": serviceValue.join(", "),
                            "status": status,
                            "bookingID": bookingid,
                            "Total parts": parts,
                            "labour": labour,
                            "total": total,
                            "invoiceid": invoice,
                            "payment": payment
                          }).then((_) {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Successfully Added')));
                            nameController.clear();
                            phoneController.clear();
                            suggestionController.clear();
                          }).catchError((onError) {
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text(onError)));
                          });
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: MaterialButton(
                      color: Colors.grey,
                      child: Text('Reset'),
                      onPressed: () {
                        _formKey.currentState.reset();
                      },
                    ),
                  ),
                ],
              )),
        ])));
  }

  Future<String> inputData() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid.toString();
    print(uid);
    return uid;
  }

  @override
  void dispose() {
    super.dispose();
    suggestionController.dispose();
    nameController.dispose();

    phoneController.dispose();

    suggestionController.dispose();
  }
}
