import 'package:flutter/material.dart';
import 'package:home_train/components/generic_banner.dart';
import 'package:home_train/constants.dart';

/*
  Screen for displaying the user's stats.
  As more detection is added, statistics will be pulled from Firebase and

  @params:
  String workout: name of the workout and subsequent API call
*/
class StatsScreen extends StatefulWidget {
  final String workout;
  const StatsScreen(this.workout, {Key? key}) : super(key: key);

  @override
  _StatsScreen createState() => _StatsScreen();
}

/*
  Current "Dummy State" for pulling up a stats page
*/
class _StatsScreen extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    String topText = widget.workout + " Analytics";
    return Scaffold(
        body: Column(children: [
      GenericBanner(
        homeTrainBlue,
        text: topText,
      )

      //TODO: Add Stats Display/Info
    ]));
  }
}
