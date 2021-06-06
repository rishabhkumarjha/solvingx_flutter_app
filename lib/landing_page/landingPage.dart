import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solvingx_ui/landing_page/body_landingPage.dart';
import 'package:solvingx_ui/landing_page/left_drawer.dart';
import 'package:solvingx_ui/services/authService.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final getIt = GetIt.instance;
  final authService = GetIt.instance<AuthService>();
  String _userImage;
  Future<GoogleSignInAccount> updateImage() async {
    GoogleSignInAccount account = await authService.signInWithGoogle();
    setState(() {
      this._userImage = account.photoUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    _userImage = authService.photo();
    return Scaffold(
      appBar: AppBar(
        title: Text("Solvingx.in"),
        centerTitle: true,
        backgroundColor: Colors.green[50],
        actions: [
          IconButton(
              onPressed: updateImage,
              tooltip: "Account Options",
              iconSize: 50,
              icon: authService.gAccount() != null
                  ? CircleAvatar(backgroundImage: NetworkImage(_userImage))
                  : Icon(Icons.login_rounded)),
        ],
      ),
      drawer: Drawer(
        child: LeftDrawer(),
      ),
      body: Body(),
    );
  }
}
