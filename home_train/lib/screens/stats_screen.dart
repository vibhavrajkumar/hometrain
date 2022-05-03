import 'package:flutter/material.dart';
import 'package:home_train/components/generic_banner.dart';
import 'package:home_train/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';
import 'package:collection/collection.dart';

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
  var rng = Random();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*
  Fetches points data from firestore for the current user and adds it to a list of FLSpots, which is displayed
  on the graph
  */
  List<FlSpot> generatePoints() {
    var docRef = _firestore.collection("users").doc(user!.uid);
    List<FlSpot> spots = [];

    docRef.get().then((snapshot) {
      List data = snapshot[widget.workout];

      for (int i = 0; i < data.length; ++i) {
        spots.add(FlSpot((i + 1.0), data[i] + 0.0));
      }
    });

    return spots;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<FlSpot> spots = generatePoints();
    num maxY = 6;

    //finds the max y value in spots to resize teh graph
    for (int i = 0; i < spots.length; i++) {
      maxY = spots[i].y > maxY ? spots[i].y : maxY;
    }

    String topText = widget.workout + " Analytics";
    List<Color> gradientColors = [
      homeTrainBlue,
      homeTrainGreen,
    ];

    return Scaffold(
        body: Column(children: [
      GenericBanner(
        homeTrainBlue,
        text: topText,
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      //Box to put Line Chart in
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.01),
                    spreadRadius: 10,
                    blurRadius: 3)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: size.width - 20,
                  height: 200,
                  child: LineChart(
                      //CITATION: https://www.codeplayon.com/2021/10/how-to-make-line-charts-in-flutter/
                      //Line Chart Data containing points and axis titles
                      LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      horizontalInterval: 1,
                      verticalInterval: 1,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: const Color(0xff37434d),
                          strokeWidth: 1,
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: const Color(0xff37434d),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    axisTitleData: FlAxisTitleData(
                      show: true,
                      rightTitle: AxisTitle(showTitle: false),
                      topTitle: AxisTitle(showTitle: false),
                      bottomTitle: AxisTitle(
                          showTitle: true, titleText: "Workout Number"),
                      leftTitle:
                          AxisTitle(showTitle: true, titleText: widget.workout),
                    ),
                    borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                            color: const Color(0xff37434d), width: 1)),
                    minX: 1,
                    maxX: max(spots.length.toDouble(), 15),
                    minY: 0,
                    maxY: maxY.toDouble(),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        colors: gradientColors,
                        barWidth: 5,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: false,
                        ),
                        belowBarData: BarAreaData(
                          show: false,
                          colors: gradientColors,
                        ),
                      ),
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}