import 'package:flutter/material.dart';

class WorkoutBox extends Container {
  WorkoutBox({Key? key}) : super(key: key);

  static Widget getWorkoutBox(Color color, String label, BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color),
            color: color,
            borderRadius: BorderRadius.circular(30)),
        width: 350.0,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
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
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          WorkoutBox.getWorkoutBox(Colors.red, "Push-Up", context),
          WorkoutBox.getWorkoutBox(Colors.blue, "Sit-Up", context),
          WorkoutBox.getWorkoutBox(Colors.green, "Squat", context),
          WorkoutBox.getWorkoutBox(Colors.deepPurpleAccent, "Plank", context),
          WorkoutBox.getWorkoutBox(
              Colors.pink, "Double Romanian Deadlifts", context),
        ],
      ),
    );
  }
}
