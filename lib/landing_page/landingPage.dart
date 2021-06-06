import 'package:flutter/material.dart';
import 'package:solvingx_ui/landing_page/body_landingPage.dart';
import 'package:solvingx_ui/landing_page/left_drawer.dart';

class LandingPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solvingx.in"),
        centerTitle: true,
        backgroundColor: Colors.green[50],
        actions: [
          IconButton(
              onPressed: () => print("hello"),
              tooltip: "Account Options",
              iconSize: 50,
              icon: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://live.staticflickr.com/7720/17052053817_58070d14f1_b.jpg"))),
        ],
      ),
      drawer: Drawer(
        child: LeftDrawer(),
      ),
      body: Body(),
    );
  }
}
