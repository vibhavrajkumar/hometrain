import 'package:flutter/material.dart';
import 'package:home_train/components/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_train/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_train/components/confetti_widgets.dart';

class SigninBuilder extends StatefulWidget {
  //new widget for signin page
  const SigninBuilder({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignIn();
}

class _SignIn extends State<SigninBuilder> {
  //actual build of the signin page
  final FirebaseAuth auth = FirebaseAuth.instance;

  /*
    Uses Google OAuth to signin and authenticate, initializes firebase for first-time users
  */
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

      var firebaseUser = FirebaseAuth.instance.currentUser;
      DocumentReference<Map<String, dynamic>> docRef =
          FirebaseFirestore.instance.collection("users").doc(firebaseUser!.uid);

      DocumentSnapshot document = await docRef.get();

      // Creates array of points for all workouts on first-time
      if (!document.exists) {
        docRef
            .set({for (String workout in constants.workouts) workout: <num>[]});
      }

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BottomNavbar()));
      // for go to the HomePage screen
    }
  }

  @override
  /*
    Creates a column of 3 evenly space objects:
      - The Logo
      - Sign In Button
      - Confetti Button
  */
  Widget build(BuildContext context) {
    //get dimensions to set sizes relative to size of screen
    double height =
        MediaQuery.of(context).size.height; //safearea (valid button locations)
    return Scaffold(
        //create widgets in a uniform line
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset("images/HomeTrainLogo.svg",
              height: 100, width: 100, fit: BoxFit.scaleDown),
          //create button for login page
          TextButton(
            //todo (link with firebase when "login" pressed)
            onPressed: () => signup(context),
            child: Container(
                //create login button with correct colors and rounded edges
                height: 50,
                width: 250,
                color: Colors.transparent,
                child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 93, 92, 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Montserrat'),
                        textAlign: TextAlign.center,
                      ),
                    ))),
          ),
          //create box with "sign up and correct colors"
          const Conf(),
        ]
            .map(
              (child) => Padding(
                padding: EdgeInsets.all(height / 20),
                child: child,
              ),
            )
            .toList(),
      ),
    ));
  }
}
