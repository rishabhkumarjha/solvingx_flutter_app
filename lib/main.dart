import 'package:flutter/material.dart';
import 'package:solvingx_ui/landing_page/landingPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(SolvingxApp());
}

class SolvingxApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Solvingx',
        theme: ThemeData(primarySwatch: Colors.grey),
        home: MyHomePage());
  }
}

class FirebaseInit extends ChangeNotifier {
  FirebaseInit() {
    init();
  }
  Future<void> init() async {
    await Firebase.initializeApp();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LandingPage();
  }
}
