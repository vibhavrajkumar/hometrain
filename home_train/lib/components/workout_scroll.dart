import 'package:flutter/material.dart';
import 'package:home_train/constants.dart' as constants;

class WorkoutBox extends Container {
  WorkoutBox({Key? key}) : super(key: key);

  static Widget getWorkoutBox(Color color, String label, BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color),
            color: color,
            borderRadius: BorderRadius.circular(30)),
        width: 300.0,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 30,
            ), // This needs to be standardized and default
          ),
        ),
        margin: const EdgeInsets.all(15),
      ),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(label + " workout started!"),
        ));
      },
    );
  }
}

class WorkoutScroll extends StatefulWidget {
  const WorkoutScroll({Key? key}) : super(key: key);

  @override
  State<WorkoutScroll> createState() => _WorkoutScroll();
}

class _WorkoutScroll extends State<WorkoutScroll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 1.0),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          WorkoutBox.getWorkoutBox(constants.mainColor, "Push-Up", context),
          WorkoutBox.getWorkoutBox(constants.mainColor, "Squat", context),
          WorkoutBox.getWorkoutBox(constants.mainColor, "Sit-Up", context),
          WorkoutBox.getWorkoutBox(constants.mainColor, "Plank", context),
          WorkoutBox.getWorkoutBox(
              constants.mainColor, "Double Romanian Deadlifts", context),
        ],
      ),
    );
  }
}
