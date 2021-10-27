import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Mock Image Classification'),
    );
  }
}

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
  String? _confidence = "";
  String _name = "";
  String _numbers = "";

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

  loadModel() async {
    var result = await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
    print("Result after loading model: $result");
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _result = res;
      String str = _result?[0]["label"];
      _name = str.substring(2);
      _confidence = _result != null
          ? (_result?[0]['confidence'] * 100.0).toString().substring(0, 2) + "%"
          : "";
    });
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              isImageLoaded
                  ? Column(
                      children: [
                        Container(
                          height: 350,
                          width: 350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(File(pickedImage!.path)),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Text('Please Select an image'),
              Text("Name : $_name\n"),
              Text("Confidence : $_confidence\n"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          grabImage(ImageSource.gallery);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.image),
      ),
    );
  }
}
