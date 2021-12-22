import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mock_img_recognition/data/model/data_model.dart';
import 'package:mock_img_recognition/data/temp_data.dart';
import 'package:mock_img_recognition/presentation/screens/info_screen.dart';
import 'package:tflite/tflite.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
    required this.name,
    required this.modelPath,
    required this.labelPath,
  }) : super(key: key);
  final String modelPath;
  final String labelPath;
  final String name;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late File? pickedImage;
  bool isImageLoaded = false;
  List? _result;
  double? _confidence = 0.0;
  String _name = "";
  String _numbers = "";
  int? index;
  dynamic humid = 0;
  dynamic lIntense = 0;
  dynamic moisture = 0;
  dynamic temp = 0;
  List<Data>? rawData;

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

  loadModel(String model, String label) async {
    var result = await Tflite.loadModel(
      model: model,
      labels: label,
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
      if (widget.name == 'Rice') {
        rawData = riceData;
        index = _result?[0]["index"] - 1;
      } else if (widget.name == 'Maize') {
        rawData = maizeData;
        index = _result?[0]["index"];
      } else if (widget.name == 'Jute') {
        rawData = juteData;
        index = _result?[0]["index"];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadModel(widget.modelPath, widget.labelPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Text(widget.name),
        centerTitle: true,
      ),
      backgroundColor: Colors.green.shade100,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/${widget.name.toLowerCase()}_leaf.png'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.15),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 50),
            isImageLoaded
                ? Column(
                    children: [
                      ClipRRect(
                        child: Container(
                          height: 350,
                          width: 350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(File(pickedImage!.path)),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Name : $_name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        "Confidence :  ${_confidence!.toStringAsFixed(2)}%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isImageLoaded = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade800,
                        ),
                        child: Text('Reset'),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const SizedBox(height: 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Card(
                                elevation: 8,
                                child: GestureDetector(
                                  onTap: () {
                                    grabImage(ImageSource.camera);
                                  },
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 70,
                                    color: Colors.green.shade900,
                                  ),
                                ),
                              ),
                              Text(
                                "Camera",
                                style: GoogleFonts.breeSerif(
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 50),
                          Column(
                            children: [
                              Card(
                                elevation: 8,
                                child: GestureDetector(
                                  onTap: () {
                                    grabImage(ImageSource.gallery);
                                  },
                                  child: Icon(
                                    Icons.image,
                                    size: 70,
                                    color: Colors.green.shade900,
                                  ),
                                ),
                              ),
                              Text(
                                "Gallery",
                                style: GoogleFonts.breeSerif(
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "( Please select only ${widget.name} images )",
                        style: GoogleFonts.breeSerif(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
      bottomNavigationBar: isImageLoaded
          ? Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green.shade800,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: IconButton(
                onPressed: () async {
                  if (widget.name == 'Maize' && index == 3) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            alignment: Alignment.center,
                            height: 250,
                            color: Colors.green.shade100,
                            child: Text('No Data Found!'),
                          ),
                        );
                      },
                    );
                  } else {
                    rawData![index!] != null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoScreen(
                                diseaseName: _name,
                                data: widget.name == 'Rice'
                                    ? rawData![index! - 1]
                                    : rawData![index!],
                              ),
                            ),
                          )
                        : showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Container(
                                  alignment: Alignment.center,
                                  height: 250,
                                  color: Colors.green.shade100,
                                  child: Text('No Data Found!'),
                                ),
                              );
                            },
                          );
                  }
                },
                icon: Icon(
                  Icons.arrow_upward_sharp,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            )
          : Container(height: 1),
    );
  }
}
