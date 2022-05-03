import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_train/components/generic_banner.dart';
import 'package:home_train/components/workout_scroll.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_train/constants.dart';
import 'package:home_train/components/camera.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*
  Function to push camera display to the top of navigator.
  Passed in to build on HomeScreen

  @param String label => Chooses which workout to track and create data for
*/
  void goToCamera(BuildContext context, String label) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CameraScreen()),
    );

    var docRef = _firestore.collection("users").doc(user!.uid);

    docRef.get().then((snapshot) {
      List<dynamic> nums = snapshot[label];
      nums.add(Random().nextInt(6).toDouble());
      docRef.update({label: nums});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childs = <Widget>[
      Positioned(
        top: 150,
        right: 0,
        child: SvgPicture.asset(
          "images/man_workout.svg",
          height: 90,
        ),
      )
    ];
    //Home page includes the top banner and workout scroll
    return Column(
      children: [
        GenericBanner(homeTrainBlue,
            text: "Let's HomeTrain!", children: childs),
        WorkoutScroll(homeTrainBlue, goToCamera)
      ],
    );
  }
}
