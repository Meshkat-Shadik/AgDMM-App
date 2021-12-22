import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mock_img_recognition/presentation/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //AgDMM
      home: const MyHomePage(title: 'AgDMM'),
    );
  }
}
