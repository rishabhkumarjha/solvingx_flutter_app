import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeftDrawer extends StatefulWidget {
  // const LeftDrawer({ Key? key }) : super(key: key);

  @override
  _LeftDrawerState createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
            decoration: BoxDecoration(color: Colors.grey[50]),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Solvingx.in",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                Text(
                  "Simplifying Everything That Is",
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ))),
        ListTile(
          onTap: () => print("Finance Clicked"),
          tileColor: Colors.white,
          leading: Icon(Icons.money_rounded),
          title: Text("Finance"),
        ),
        ListTile(
          onTap: () => print("Health Clicked"),
          tileColor: Colors.white,
          leading: Icon(Icons.health_and_safety_rounded),
          title: Text("Health"),
        ),
        ListTile(
          onTap: () => print("Culture Clicked"),
          tileColor: Colors.white,
          leading: Icon(Icons.tour_outlined),
          title: Text("Culture and Tourism"),
        ),
        ListTile(
          onTap: () => print("Learning Clicked"),
          tileColor: Colors.white,
          leading: Icon(Icons.bookmark),
          title: Text("Learning"),
        )
      ],
    );
  }
}

class LandingPageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          child: Column(
            children: [
              Icon(
                Icons.account_circle,
                size: MediaQuery.of(context).size.height / 10,
              ),
              Text(
                "Rishabh Jha",
                style: TextStyle(fontSize: 26),
              ),
              Text("SUPERADMIN"),
            ],
          ),
        ),
        Text("Applications"),
      ],
    );
  }
}
