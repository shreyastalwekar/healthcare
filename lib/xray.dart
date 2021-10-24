import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

import 'maindrawer.dart';

class DetectMain extends StatefulWidget {
  @override
  _DetectMainState createState() => new _DetectMainState();
}

class _DetectMainState extends State<DetectMain> {
  PickedFile _image;
  var _recognitions;
  final ImagePicker _picker = ImagePicker();
  static Future<String> loadModel() async {
    Tflite.close();
    try {
      String res;
      res = await Tflite.loadModel(
        model: "assets/converted_model.tflite",
        labels: "assets/labels.txt",
      );
      print(res);
    } on PlatformException {
      print("Failed to load the model");
    }
  }

  // run prediction using TFLite on given image
  Future predict(PickedFile image) async {
    var recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );

    print(recognitions);

    setState(() {
      _recognitions = recognitions;
    });
  }

  sendImage(PickedFile image) async {
    if (image == null) return;
    await predict(image);
  }

  selectFromGallery() async {
    var image = await _picker.getImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {});
    sendImage(image);
  }

  // select image from camera
  selectFromCamera() async {
    var image = await _picker.getImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {});
    sendImage(image);
  }

  @override
  void initState() {
    super.initState();

    loadModel().then((val) {
      setState(() {});
    });
  }

  Widget printValue(rcg) {
    if (rcg == null) {
      return Text('',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700));
    } else if (rcg.isEmpty) {
      return Center(
        child: Text("Could not recognize",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
      );
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Center(
        child: Text(
          "Covid Result : " +
              _recognitions[0]['label'].toString().toUpperCase(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Covid Detector",
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainDrawer()),
              );
            },
          ),
          backgroundColor: Color.fromRGBO(2, 64, 134, 01),
        ),
        body: Container(
          //height: 500,
          width: 500,
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.transparent,
                height: 200,
                width: double.infinity,
                child: Image.network(
                    'https://binaries.templates.cdn.office.net/support/templates/en-us/lt89922682_quantized.png',
                    fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: printValue(_recognitions),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Center(
                  child: Text(
                    "Upload X-ray Image : ",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Container(
                      height: 50,
                      width: 150,
                      child: RaisedButton.icon(
                        onPressed: selectFromCamera,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 30,
                        ),
                        color: Colors.pink,
                        label: Text(
                          "Camera",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: FlatButton.icon(
                      onPressed: selectFromGallery,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      icon: Icon(
                        Icons.file_upload,
                        color: Colors.white,
                        size: 30,
                      ),
                      color: Colors.teal,
                      label: Text(
                        "Gallery",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                child: resultt(),
              ),
            ],
          ),
        ));
  }

  Widget resultt() {
    if (_recognitions == null) {
      return Center(
        child: Text(
          "",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      );
    } else if (_recognitions[0]['label'].toString().toUpperCase() ==
        'POSITIVE') {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: AlertDialog(
          shape: ShapeBorder.lerp(null, null, 5),
          title: Text(
            "Your Result is Positive",
            style: TextStyle(color: Colors.red),
          ),
          content: Text("Take Care and Quarantine Yourself"),
          actions: [
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: AlertDialog(
        shape: ShapeBorder.lerp(null, null, 15),
        title: Text(
          "Your Result is Negative",
          style: TextStyle(color: Colors.green),
        ),
        content: Text("Please take Precautions and Wear Mask"),
        actions: [
          FlatButton(
            child: Text("Ok"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
