import 'package:flutter/material.dart';
import 'package:home_train/components/generic_banner.dart';
import 'package:home_train/components/signin_widgets.dart';
import 'package:home_train/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/*
  Screen for displaying the user's Profile.

  @params:
*/
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

/*
  Pulls up the profile page
   - Calls Firebase to Fetch User Info
   - Allows for Complete Sign Out from both Firebase + Google Auth
*/
class _ProfileScreen extends State<ProfileScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  get child => null;
  getProfileImage(BuildContext context) {
    /*
      Dummy Image if the server can't connect
    */
    return Image.network(_firebaseAuth.currentUser!.photoURL!,
        height: 50, width: 50, errorBuilder: (context, error, stackTrace) {
      return const Icon(Icons.account_circle, size: 50);
    });
  }

  Future<void> signout() async {
    return await _firebaseAuth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    return Scaffold(
        body: Column(children: [
      GenericBanner(
        homeTrainGreen,
        text:
            "Let's Profile, \n" + _firebaseAuth.currentUser!.displayName! + "!",
      ),

      Padding(
        padding: const EdgeInsets.all(15.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: getProfileImage(context)),
      ),

      Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
          child: SizedBox(
              height: 50,
              width: 150,
              child: TextButton(
                  onPressed: () {
                    signout();
                    final googleSignIn = GoogleSignIn();
                    googleSignIn.disconnect();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninBuilder()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(homeTrainBlue),
                  ),
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ))))
      //TextButton(onPressed: () {Navigator.pop(context);}, child: Container()),
    ]));
  }
}
