import 'package:flutter/material.dart';
import 'package:home_train/components/workout_scroll.dart';
import 'package:home_train/components/home_banner.dart';

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
      children: [const HomeBanner(), WorkoutScroll(0)],
    );
  }
}
