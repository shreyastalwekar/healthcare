import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'bookappointment.dart';
import 'service/city.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final List<String> imgList = [
    "https://www.medicoverhospitals.in/wp-content/uploads/2019/09/kurnool-medicover-hospitals.jpg",
    "https://www.cancer.net/sites/cancer.net/files/ct-scans-fb.png",
    "https://mediglobus.com/wp-content/uploads/2018/03/artemis-hospital-india-lobby.jpeg",
    "https://cdn.shortpixel.ai/client/q_glossy,ret_img/https://ilshospitals.com/wp-content/uploads/2019/03/agartala.jpg"
  ];
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 =
        VideoPlayerController.asset('lib/assets/video1.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
      // Try playing around with some of these other options:

      // showControls: true,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Color(0xff225643),
      //   handleColor: Color(0xff225643),
      //   backgroundColor: Colors.black,
      //   bufferedColor: Colors.white,
      // ),
      // placeholder: Container(
      //   color: Colors.black,
      // ),
      //autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                video(),
                SizedBox(
                  height: 5,
                ),
                // SizedBox(height: 5,),
                service(),
                SizedBox(
                  height: 5,
                ),
                slider1(),
                SizedBox(
                  height: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  Container slider1() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CarouselSlider(
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
            items: imgList.map(
              (url) {
                return Container(
                  margin: EdgeInsets.all(1.0),
                  // decoration: BoxDecoration(color: Colors.green),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      width: 1000.0,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }

  Container video() {
    return Container(
      height: 260,
      width: 380,
      child: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        ],
      ),
    );
  }

  Container service() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //  Image.asset(
          //     'lib/assets/alignpros.png',
          //     height: 100,
          //     width: 300,
          //     fit: BoxFit.fitWidth,
          //   ),
          SizedBox(
            height: 1,
          ),
          Container(
            margin: EdgeInsets.only(left: 7, right: 7, top: 1),
            width: double.infinity,
            // height: 280.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0.0, 3.0),
                      blurRadius: 5.0)
                ]),

            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Our Services",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              radius: 30,
                              backgroundImage: new AssetImage(
                                "lib/assets/physician.png",
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Physician',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
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
                              radius: 30,
                              backgroundImage: new AssetImage(
                                "lib/assets/dental-care.png",
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Dentist',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
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
                              radius: 30,
                              backgroundImage: new AssetImage(
                                "lib/assets/dermatology.png",
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Dermatology',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              radius: 30,
                              backgroundImage: new AssetImage(
                                "lib/assets/pediatric.jpg",
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Pediatric',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
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
                              radius: 30,
                              backgroundImage: new AssetImage(
                                "lib/assets/orthopedic.jpg",
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Orthopedician',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
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
                              radius: 30,
                              backgroundImage: new AssetImage(
                                "lib/assets/homeopathy.png",
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Homeopathy',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              radius: 30,
                              backgroundImage: new AssetImage(
                                "lib/assets/cardiology.png",
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Cardiology',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
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
                              radius: 30,
                              foregroundColor: Colors.amber,
                              backgroundImage: new AssetImage(
                                "lib/assets/gynecologist.png",
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Gynecologist',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
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
                              radius: 30,
                              backgroundImage: new AssetImage(
                                "lib/assets/neurologist.png",
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Neurologists',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              radius: 30,
                              backgroundImage: new AssetImage(
                                "lib/assets/neurologist.png",
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Neurologist',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: new CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                              foregroundColor: Colors.amber,
                              backgroundImage: new AssetImage(
                                "lib/assets/radiologist.png",
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Radiologist',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
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
                              radius: 30,
                              backgroundImage: new AssetImage(
                                "lib/assets/ayurveda.png",
                                //fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Ayurveda',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 1, right: 1, top: 10, bottom: 5),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70,
                  width: 370,
                  child: RaisedButton(
                    color: Colors.pink,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "Book Your Appointment Now",
                      style: TextStyle(fontSize: 20, fontFamily: 'Lobster'),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Appointment(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
