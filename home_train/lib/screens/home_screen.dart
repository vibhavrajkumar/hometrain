import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_train/components/generic_banner.dart';
import 'package:home_train/components/workout_scroll.dart';
import 'package:home_train/constants.dart';
import 'package:home_train/components/camera.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  /*
  Function to push camera display to the top of navigator.
  Passed in to build on HomeScreen

  @param String _ => dummy argument to allow for name-passing capabilities
*/
  void goToCamera(BuildContext context, [String? _]) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childs = <Widget>[
      Positioned(
        top: 150,
        right: 0,
        child: SvgPicture.asset(
          "images/man_workout.svg",
          height: 150,
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
