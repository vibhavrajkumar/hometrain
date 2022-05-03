import 'package:flutter/material.dart';
import 'package:home_train/components/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_train/constants.dart' as constants;
import 'package:flutter_svg/flutter_svg.dart';

class SigninBuilder extends StatefulWidget {
  //new widget for signin page
  const SigninBuilder({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignIn();
}

class _SignIn extends State<SigninBuilder> {
  //actual build of the signin page
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

      var firebaseUser = FirebaseAuth.instance.currentUser;
      DocumentReference<Map<String, dynamic>> docRef =
          FirebaseFirestore.instance.collection("users").doc(firebaseUser!.uid);

      DocumentSnapshot document = await docRef.get();

      if (!document.exists) {
        docRef
            .set({for (String workout in constants.workouts) workout: <num>[]});
      }

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BottomNavbar()));
      // for go to the HomePage screen
    }
  }

  bool value = false;
  @override
  Widget build(BuildContext context) {
    //get dimensions to set sizes relative to size of screen
    double width = MediaQuery.of(context).size.width;
    double height =
        MediaQuery.of(context).size.height; //safearea (valid button locations)
    var padding = MediaQuery.of(context).padding;
    double total_height = height -
        padding.top -
        padding.bottom; //total height (including unsafe area)
    return Scaffold(
        //create widgets in a uniform line
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset("images/HomeTrainLogo.svg",
              height: 100, width: 100, fit: BoxFit.scaleDown), //logo
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
          TextButton(
              //when button is pressed, send to sign up page
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignUpBuilder()),
                );
              },
              child: Container(
                  height: 50,
                  width: 250,
                  color: Colors.transparent,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 66, 96, 1.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Montserrat'),
                          textAlign: TextAlign.center,
                        ),
                      )))),
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

class SignUpBuilder extends StatefulWidget {
  //widget for the signup page
  const SignUpBuilder({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUp();
}

class _SignUp extends State<SignUpBuilder> {
  //build of the signup page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //create top bar of the signup page with rounded bottom borders
        appBar: AppBar(
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0))),
          backgroundColor: const Color.fromRGBO(0, 93, 92, 1.0),
          leading: Builder(
            builder: (BuildContext context) {
              //go back to previous screen when back button pressed
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          title: const Text('Sign Up',
              style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
        ),
        body: Column(
          //create text fields and signup button align in a column
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //create username creation textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            //create password creation textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            //create confirm password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
              ),
            ),
            //create signup button with rounded edges
            TextButton(
              onPressed: () {},
              child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.transparent,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 93, 92, 1.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Montserrat'),
                          textAlign: TextAlign.center,
                        ),
                      ))),
            ),
          ],
        ));
  }
}



// Scaffold(
//         //create an app bar (bar on the top portion of the screen)
//         appBar: AppBar(
//           shape: const ContinuousRectangleBorder(
//               //give the bar rounded edges on the bottom to make it cleaner
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20.0),
//                   bottomRight: Radius.circular(20.0))),
//           backgroundColor: const Color.fromRGBO(0, 93, 92, 1.0),
//           leading: Builder(
//             builder: (BuildContext context) {
//               //create back button, when pressed will return to previous screen
//               return IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               );
//             },
//           ),
//           title: const Text('Sign In',
//               style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
//         ),
//         body: Column(
//           //create text fields and login button
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             //   //textfield for username
//             //   Padding(
//             //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//             //     child: TextFormField(
//             //       decoration: const InputDecoration(
//             //         border: UnderlineInputBorder(),
//             //         labelText: 'Enter your username',
//             //       ),
//             //     ),
//             //   ),
//             //   Padding(
//             //     //textfield for password
//             //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//             //     child: TextFormField(
//             //       obscureText: true,
//             //       decoration: const InputDecoration(
//             //         border: UnderlineInputBorder(),
//             //         labelText: 'Enter your password',
//             //       ),
//             //     ),
//             //   ),
//             //   Padding(
//             //     //create "Remember Me" checkbox
//             //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//             //     child: Row(children: <Widget>[
//             //       // create in a uniform row
//             //       //text for checkbox
//             //       const Text(
//             //         'Remember Me',
//             //         style: TextStyle(
//             //             color: Color.fromRGBO(0, 93, 92, 1.0),
//             //             fontSize: 15,
//             //             fontFamily: 'Montserrat'),
//             //       ),
//             //       //textbox with theme fill color
//             //       Checkbox(
//             //           value: this.value,
//             //           onChanged: (bool? value) {
//             //             setState(() {
//             //               this.value = value!;
//             //             });
//             //           },
//             //           checkColor: Colors.white,
//             //           activeColor: const Color.fromRGBO(0, 93, 92, 1.0))
//             //     ]),
//             //  

