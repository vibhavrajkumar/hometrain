import 'package:flutter/material.dart';

//Main colors
const homeTrainBlue = Color.fromRGBO(00, 42, 60, 1);
const homeTrainGreen = Color.fromRGBO(00, 93, 92, 1);

/*
Given a number greater than or equal to 2, creates a "choppy" gradient
by finding the colors inbetween our two-color standard:

Takes: num > 2

HomeTrain Blue: #R:00 G:42 B: 60
HomeTrain Green: #R:00 G:5D B: 5C

*/
List<Color> colorTransition(int num, bool reverse) {
  var distance = Color.fromRGBO(
      homeTrainGreen.red - homeTrainBlue.red,
      homeTrainGreen.green - homeTrainBlue.green,
      homeTrainGreen.blue - homeTrainBlue.blue,
      1);

  List<Color> colors = [];
  for (var i = 0; i < num; i++) {
    var newBlue = homeTrainBlue.blue + (i * distance.blue / (num - 1)).round();
    var newGreen =
        homeTrainBlue.green + (i * distance.green / (num - 1)).round();
    var newRed = homeTrainBlue.red + (i * distance.red / (num - 1)).round();
    colors.add(Color.fromRGBO(newRed, newGreen, newBlue, 1));
  }
  return !reverse ? colors : colors.reversed.toList();
}
