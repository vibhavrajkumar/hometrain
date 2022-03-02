import 'package:flutter/material.dart';
import 'package:home_train/constants.dart' as constants;

List<Widget> getWorkoutBoxes(List<String> labels, BuildContext context) {
  var gradient = constants.colorTransition(labels.length);
  List<Widget> boxes = [];
  for (var i = 0; i < labels.length; i++) {
    boxes.add(getWorkoutBox(labels[i], gradient[i], context));
  }
  return boxes;
}

Widget getWorkoutBox(String label, Color color, BuildContext context) {
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
          children: getWorkoutBoxes([
            "Push-Ups",
            "Sit-Ups",
            "Squats",
            "Plank",
          ], context)),
    );
  }
}
