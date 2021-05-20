import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              Text("SUPERADMIN")
            ],
          ),
        ),
      ],
    );
  }
}
