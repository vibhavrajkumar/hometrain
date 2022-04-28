import 'dart:html';

import 'package:flutter/material.dart';
import 'package:home_train/constants.dart' as constants;
import 'navbar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    //debugPrint("Test 1 Adarsh");
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      debugPrint("Test 1 Adarsh");

      if (result != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavbar()),
        );
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      primary: Colors.black87,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          // if (states.contains(MaterialState.pressed))
          return BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          );
          // return null; // Defer to the widget's default.
        },
      ),
    );

    return Scaffold(
      body: Center(
          child: OutlinedButton(
        style: outlineButtonStyle,
        onPressed: () => signup(context),
        child: Text('Sign in with Google'),
      )),
    );
  }
}
