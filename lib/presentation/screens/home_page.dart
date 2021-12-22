import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mock_img_recognition/presentation/screens/landing_page.dart';
import 'package:mock_img_recognition/presentation/widgets/section_button.dart';
import 'package:tflite/tflite.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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

  grabImage(ImageSource source) async {
    var tempStore = await ImagePicker().pickImage(source: source);
    setState(() {
      if (tempStore != null) {
        pickedImage = File(tempStore.path);
        isImageLoaded = true;
        applyModelOnImage(pickedImage!);
      } else {
        print('Please select an Image to test');
      }
    });
  }

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

  loadModel(String model, String label) async {
    var result = await Tflite.loadModel(
      model: model,
      // 'assets/model_unquant.tflite',
      labels: label,
      //'assets/labels.txt',
    );
    print("Result after loading model: $result");
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.00005,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      print(res);
      _result = res;
      String str = _result?[0]["label"];
      _name = str.substring(2);
      _confidence = _result != null ? (_result?[0]['confidence'] * 100.0) : 0.0;
    });
  }

  @override
  void initState() {
    super.initState();
    //loadModel();
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
          leading: IconButton(
            onPressed: () async {
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.green.shade800,
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
                                      backgroundColor: Colors.green.shade800,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.green.shade800,
                                      child: Text(
                                        moisture == null ? ".." : '${moisture}',
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
                                      backgroundColor: Colors.green.shade800,
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
            icon: Icon(Icons.sensors),
          ),
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: Colors.green.shade800,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
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
                    SectionButton(
                      path: 'assets/mung_bean_leaf.png',
                      title: 'Mung Bean',
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




/**/