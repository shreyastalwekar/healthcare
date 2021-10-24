import 'package:flutter/material.dart';

import 'maindrawer.dart';

class FAQs extends StatefulWidget {
  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  double _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //toolbarHeight: 59,
          title: Text('Frequently Asked Question'),
        ),
        drawer: MainDrawer(),
        //backgroundColor: Colors.teal,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Center(
                  child: Image.asset(
                    'lib/assets/faqs.png',
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //Padding(padding: EdgeInsets.fromLTRB(1, 2, 2, 2)),

                    ExpansionTile(
                      leading: Text(
                        '1 .',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        'What should you recommend to carry on the checkup visit?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_drop_down),
                      children: <Widget>[
                        ListTile(
                          leading: Text(
                            'Ans.',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: new Text(
                              'You should carry your past medical reports, xrays and documents and past medicines you were taking so that doctor can do a proper checkup.'),
                        ),
                      ],
                    ),
                    // Divider(
                    //   thickness: 2,
                    //   indent: 35,
                    //   endIndent: 35,
                    // ),
                    ExpansionTile(
                      leading: Text(
                        '2 .',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        'How do I use the online booking service?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_drop_down),
                      children: <Widget>[
                        ListTile(
                          leading: Text(
                            'Ans.',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: new Text(
                              'You search for the doctor whose appointment is required. Go to his online calendar,look for his availability and then select the slot and get a confirmed booking after providing the necessary credentials and making payment. '),
                        ),
                      ],
                    ),
                    // Divider(
                    //   thickness: 2,
                    //   indent: 35,
                    //   endIndent: 35,
                    // ),
                    ExpansionTile(
                      leading: Text(
                        '3 .',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        'Do I need to make an appointment?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_drop_down),
                      children: <Widget>[
                        ListTile(
                            leading: Text(
                              'Ans.',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            title: new Text(
                                "For most service and repair jobs, we would ask you to make an appointment, so we can allocate workshop time that is convenient to you. We do however, stress to all our customers that if it's an emergency, or just one of those annoying little jobs, to simply bring your vehicle straight round!.")),
                      ],
                    ),
                    // Divider(
                    //   thickness: 2,
                    //   indent: 35,
                    //   endIndent: 35,
                    // ),
                    ExpansionTile(
                      leading: Text(
                        '4 .',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        'Will the price I am quoted be the price I pay?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_drop_down),
                      children: <Widget>[
                        ListTile(
                          leading: Text(
                            'Ans.',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: new Text(
                              " Yes. We adhere ridgedly to our quoted prices, and all prices quoted in person are final.  We will absolutely never carry out any additional work unless you have been contacted, had the work fully explained to you been given an updated quotation, and we have received your approval."),
                        ),
                      ],
                    ),
                    // Divider(
                    //   thickness: 2,
                    //   indent: 35,
                    //   endIndent: 35,
                    // ),
                    ExpansionTile(
                      leading: Text(
                        '5 .',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        'Can I schedule more than one appointment with a single doctor .',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_drop_down),
                      children: <Widget>[
                        ListTile(
                          leading: Text(
                            'Ans.',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: new Text(
                              "This can be done. We do not prevent you from getting multiple appointments done either for a same patient or different patients for a same date or different dates."),
                        ),
                      ],
                    ),
                    // Divider(
                    //   thickness: 2,
                    //   indent: 35,
                    //   endIndent: 35,
                    // ),
                    ExpansionTile(
                      leading: Text(
                        '6 .',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        'Can I make an online booking with my credit card for somebody else ?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_drop_down),
                      children: <Widget>[
                        ListTile(
                          leading: Text(
                            'Ans.',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: new Text("This is allowed"),
                        ),
                      ],
                    ),
                    // Divider(
                    //   thickness: 2,
                    //   indent: 35,
                    //   endIndent: 35,
                    // ),
                    ExpansionTile(
                      leading: Text(
                        '7 .',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        'Need I contact the doctor after I have done an online appointment ?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_drop_down),
                      children: <Widget>[
                        ListTile(
                          leading: Text(
                            'Ans.',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: new Text(
                              "This is in your interest to contact the doctor on the numbers as provided on his profile page or on the “Appointment Receipt”. This will help in ascertaining the exact timing on the selected time slot on the appointment date."),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }
}
