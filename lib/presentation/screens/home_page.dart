import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_img_recognition/presentation/screens/landing_page.dart';
import 'package:mock_img_recognition/presentation/widgets/pdf_view.dart';
import 'package:mock_img_recognition/presentation/widgets/section_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//disease symptoms and solutions

class _MyHomePageState extends State<MyHomePage> {
  late File? pickedImage;
  bool isImageLoaded = false;
  List? _result;
  double? _confidence = 0.0;
  String _name = "";
  String _numbers = "";

  dynamic humid = 0;
  dynamic lIntense = 0;
  dynamic moisture = 0;
  dynamic temp = 0;

  late final dref = FirebaseDatabase.instance.reference();
  late DatabaseReference databaseReference;

  showData() async {
    dref.once().then((value) {
      print(value.value);
      setState(() {
        humid = value.value['HUMIDITY'];
        lIntense = value.value['LIGHT_INTNSITY'];
        temp = value.value['TEMPERATURE'];
        moisture = value.value['SOIL_MOISTURE'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    showData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: Colors.green.shade800,
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AgDMM',
                      style: GoogleFonts.breeSerif(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Agro-Disease Monitoring and Management',
                      style: GoogleFonts.breeSerif(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1),
              Container(
                color: Colors.green.shade50,
                child: ListTile(
                  leading: Icon(Icons.sensors),
                  title: const Text('Sensor Value'),
                  onTap: () async {
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: 250,
                              color: Colors.green.shade100,
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      return await showData();
                                    },
                                    icon: Icon(Icons.refresh),
                                    tooltip: 'Refresh',
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundColor:
                                                Colors.green.shade800,
                                            child: Text(
                                              humid == null
                                                  ? ".."
                                                  : '${humid?.toStringAsFixed(1)}',
                                              style: GoogleFonts.breeSerif(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text('Humidity')
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundColor:
                                                Colors.green.shade800,
                                            child: Text(
                                              lIntense == null
                                                  ? ".."
                                                  : '${lIntense?.toStringAsFixed(1)}',
                                              style: GoogleFonts.breeSerif(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text('Light Intensity')
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundColor:
                                                Colors.green.shade800,
                                            child: Text(
                                              moisture == null
                                                  ? ".."
                                                  : '${moisture}',
                                              style: GoogleFonts.breeSerif(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text('Soil Moisture')
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundColor:
                                                Colors.green.shade800,
                                            child: Text(
                                              temp == null
                                                  ? ".."
                                                  : '${temp!.toStringAsFixed(1)}',
                                              style: GoogleFonts.breeSerif(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text('Temperature')
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
              Divider(thickness: 1),
              Container(
                color: Colors.green.shade50,
                child: ListTile(
                  leading: Icon(Icons.call),
                  title: const Text('Contact'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            alignment: Alignment.center,
                            height: 250,
                            color: Colors.green.shade100,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  'Dr. S.M. Taohidul Islam',
                                  style: GoogleFonts.breeSerif(
                                    fontSize: 22,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Professor',
                                  style: GoogleFonts.breeSerif(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 50),
                                Text(
                                  'Contact Information',
                                  style: GoogleFonts.breeSerif(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.call),
                                    Text(
                                      '+8801719018370',
                                      style: GoogleFonts.breeSerif(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 35),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.email),
                                    Text(
                                      'staohidul@yahoo.com',
                                      style: GoogleFonts.breeSerif(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Divider(thickness: 1),
              Container(
                color: Colors.green.shade50,
                child: ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PdfViewWidget()));
                  },
                ),
              ),
              Divider(thickness: 1),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                color: Colors.green.shade50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/rice.png',
                      height: 100,
                    ),
                    Text(
                      'Agro-Disease Monitoring and Management',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 70),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LandingPage(
                              modelPath: 'assets/model_rice.tflite',
                              labelPath: 'assets/labels_rice.txt',
                              name: 'Rice',
                            ),
                          ),
                        );
                      },
                      child: SectionButton(
                        path: 'assets/rice_leaf.png',
                        title: 'Rice',
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LandingPage(
                              modelPath: 'assets/model_jute.tflite',
                              labelPath: 'assets/labels_jute.txt',
                              name: 'Rice',
                            ),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LandingPage(
                                modelPath: 'assets/model_maize.tflite',
                                labelPath: 'assets/labels_maize.txt',
                                name: 'Maize',
                              ),
                            ),
                          );
                        },
                        child: SectionButton(
                          path: 'assets/maize_leaf.png',
                          title: 'Maize',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LandingPage(
                              modelPath: 'assets/model_jute.tflite',
                              labelPath: 'assets/labels_jute.txt',
                              name: 'Jute',
                            ),
                          ),
                        );
                      },
                      child: SectionButton(
                        path: 'assets/jute_leaf.png',
                        title: 'Jute',
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LandingPage(
                              modelPath: 'assets/model_soybean.tflite',
                              labelPath: 'assets/labels_soybean.txt',
                              name: 'Soybean',
                            ),
                          ),
                        );
                      },
                      child: SectionButton(
                        path: 'assets/soybean_leaf.png',
                        title: 'Soybean',
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LandingPage(
                              modelPath: 'assets/model_soybean.tflite',
                              labelPath: 'assets/labels_soybean.txt',
                              name: 'Wheat',
                            ),
                          ),
                        );
                      },
                      child: SectionButton(
                        path: 'assets/wheat_leaf.png',
                        title: 'Wheat',
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/footer.png',
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.miniCenterFloat,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     grabImage(ImageSource.gallery);
        //   },
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.image),
        // ),
      ),
    );
  }
}
