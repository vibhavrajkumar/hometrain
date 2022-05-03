import 'package:flutter/material.dart';
import 'package:home_train/components/generic_banner.dart';
import 'package:home_train/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

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
  @override
  Widget build(BuildContext context) {
    var counter = 0;
    var size = MediaQuery.of(context).size;
    List<FlSpot> spots = [
      FlSpot(0, rng.nextInt(6).toDouble()),
      FlSpot(2.6, rng.nextInt(6).toDouble()),
      FlSpot(4.9, rng.nextInt(6).toDouble()),
      FlSpot(6.8, rng.nextInt(6).toDouble()),
      FlSpot(8, rng.nextInt(6).toDouble()),
      FlSpot(9.5, rng.nextInt(6).toDouble()),
      FlSpot(11, rng.nextInt(6).toDouble()),
    ];
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
            child: IconButton(onPressed: () {Navigator.pop(context);} , icon: const Icon(Icons.arrow_back), color: Colors.white), )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
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
                      /////////////////***********CITATION: https://www.codeplayon.com/2021/10/how-to-make-line-charts-in-flutter/*****************///////////////// */

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
                      bottomTitle:
                          AxisTitle(showTitle: true, titleText: "Days"),
                      leftTitle:
                          AxisTitle(showTitle: true, titleText: widget.workout),
                    ),
                    borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                            color: const Color(0xff37434d), width: 1)),
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: 6,
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
      // SizedBox(height: 20),
      // Wrap(
      //   spacing: 20,
      //   children: [
      //     Padding(
      //         padding: const EdgeInsets.only(
      //             left: 25, right: 25, top: 20, bottom: 20),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             GestureDetector(
      //                 onTap: () {
      //                   counter--;
      //                   if (counter < 0) {
      //                     counter = 0;
      //                   }
      //                 },
      //                 child: Container(
      //                     width: 40,
      //                     height: 40,
      //                     decoration: BoxDecoration(
      //                         color: homeTrainGreen, shape: BoxShape.circle),
      //                     child: Icon(Icons.arrow_back, color: Colors.white)))
      //           ],
      //         )),
      //     Padding(
      //         padding: const EdgeInsets.only(
      //             left: 25, right: 25, top: 20, bottom: 20),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             GestureDetector(
      //                 onTap: () {
      //                   counter++;
      //                   if (counter > 11) {
      //                     counter = 11;
      //                   }
      //                 },
      //                 child: Container(
      //                     width: 40,
      //                     height: 40,
      //                     decoration: BoxDecoration(
      //                         color: homeTrainBlue, shape: BoxShape.circle),
      //                     child:
      //                         Icon(Icons.arrow_forward, color: Colors.white)))
      //           ],
      //         ))
      //   ],
      // ),
      // SizedBox(height: 20),
      // Text(spots[counter].y.toString(),
      //     textAlign: TextAlign.center,
      //     style: TextStyle(color: Colors.black, fontSize: 30))
    ]));
  }
}

//TODO: Generalize to show all users' stats