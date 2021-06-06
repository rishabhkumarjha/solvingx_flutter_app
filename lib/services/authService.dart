import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  GoogleSignIn _googleSignIn;
  GoogleSignInAccount _account;
  AuthService() {
    init();
  }
  void init() async {
    print("init AuthService");
    this._googleSignIn = GoogleSignIn();
    // await Firebase.initializeApp();
    // await FirebaseAuth.instance;

    // UserCredential userCredential = FirebaseAuth.instance.signInWithPopup(provider)
  }

  Future<GoogleSignInAccount> signInWithGoogle() async {
    print("Auth Service Invoked to sign in with google");
    try {
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      print("signed in");
      print("name ==== " + googleSignInAccount.displayName);
      this._account = googleSignInAccount;
      return googleSignInAccount;
    } catch (error) {
      print("signin error == " + error.toString());
    }
  }

  String accountName() {
    return this._account.displayName;
  }

  String email() {
    return this._account.email;
  }

  String id() {
    return this._account.id;
  }

  String photo() {
    return this._account != null
        ? this._account.photoUrl
        : "https://live.staticflickr.com/7720/17052053817_58070d14f1_b.jpg";
  }

  GoogleSignInAccount gAccount() {
    return this._account;
  }
}
