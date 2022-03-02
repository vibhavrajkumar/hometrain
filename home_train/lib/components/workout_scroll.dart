import 'package:flutter/material.dart';
import 'package:home_train/constants.dart' as constants;
import 'package:home_train/components/camera.dart';

import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
}

/*
  Takes in a list of labels to dynamically create a list of scrollable boxes
  Calls [colorTransition] to create a gradient.
*/
List<Widget> getWorkoutBoxes(List<String> labels, BuildContext context) {
  var gradient = constants.colorTransition(labels.length);
  List<Widget> boxes = [];
  for (var i = 0; i < labels.length; i++) {
    boxes.add(getWorkoutBox(labels[i], gradient[i], context));
  }
  return boxes;
}

/*
  Creates a button with rounded edges through [BoxDecoration]
  Centers label horizontally and vertically and adds margins to edges.
*/
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
      // TODO: IMPLEMENT REAL FUNCTIONALITY FOR BUTTON
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CameraScreen()),
      );
    },
  );
}

/*
  Creates Widget for Workout Scroll
  Might make stateless later if it doesn't need to be dynamically updated
*/
class WorkoutScroll extends StatefulWidget {
  const WorkoutScroll({Key? key}) : super(key: key);

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
          children: getWorkoutBoxes([
            "Push-Ups",
            "Sit-Ups",
            "Squats",
            "Plank",
          ], context)),
    );
  }
}
