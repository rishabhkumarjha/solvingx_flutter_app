import 'package:flutter/material.dart';
import 'package:solvingx_ui/landing_page/body_landingPage.dart';
import 'package:solvingx_ui/landing_page/drawer_landingPage.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Solvingx.in")),
      drawer: Drawer(
        child: LandingPageDrawer(),
      ),
      body: Body(),
    );
  }
}
