import 'package:flutter/material.dart';
import 'package:home_train/components/workout_scroll.dart';
import 'package:home_train/components/generic_banner.dart';
import 'package:home_train/constants.dart';
import 'package:home_train/screens/stats_screen.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  _WorkoutScreen createState() => _WorkoutScreen();
}

class _WorkoutScreen extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    //Home page includes the top banner and workout scroll
    return Column(
      children: [
        const GenericBanner(
          homeTrainGreen,
          text: "Let's Analyze!",
        ),
        WorkoutScroll(homeTrainGreen, goToStatScreen)
      ],
    );
  }

  /*
  Function to push stats display to the top of navigator.

  @param String workout => which workout stats to display;
  Will be used in Firebase API call
*/
  void goToStatScreen(BuildContext context, String workout) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StatsScreen(workout)),
    );
  }
}
