import 'package:flutter/material.dart';
import 'package:home_train/constants.dart' as constants;

/*
  Takes in a list of labels to dynamically create a list of scrollable boxes
  Calls [colorTransition] to create a gradient.

  Uses tapEvent function to call something based on the label 
  (see stats screen + home page)
*/
List<Widget> getWorkoutBoxes(List<String> labels, Function tapEvent,
    bool reverse, BuildContext context) {
  var gradient = constants.colorTransition(labels.length, reverse);
  List<Widget> boxes = [];
  for (var i = 0; i < labels.length; i++) {
    boxes.add(getWorkoutBox(labels[i], gradient[i], context, tapEvent));
  }
  return boxes;
}

/*
  Creates a button with rounded edges through [BoxDecoration]
  Centers label horizontally and vertically and adds margins to edges.
*/
Widget getWorkoutBox(
    String label, Color color, BuildContext context, Function tapEvent) {
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
        tapEvent(context, label);
      });
}

/*
  Creates Widget for Workout Scroll
*/
class WorkoutScroll extends StatefulWidget {
  final Color color;
  final Function tapEvent;
  const WorkoutScroll(this.color, this.tapEvent, {Key? key}) : super(key: key);

  @override
  State<WorkoutScroll> createState() => _WorkoutScroll();
}

/*
  State and Build for WorkoutScroll
*/
class _WorkoutScroll extends State<WorkoutScroll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 1.0),
      height: 200,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: getWorkoutBoxes(constants.workouts, widget.tapEvent,
              widget.color == constants.homeTrainGreen, context)),
    );
  }
}
