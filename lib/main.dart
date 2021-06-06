import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:solvingx_ui/landing_page/landingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:solvingx_ui/services/authService.dart';

void main() {
  setup();
  runApp(SolvingxApp());
}

void setup() {
  final getIt = GetIt.instance;
  getIt.registerSingleton(AuthService());
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LandingPage();
  }
}
