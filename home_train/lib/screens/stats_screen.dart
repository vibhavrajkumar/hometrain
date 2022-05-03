import 'package:flutter/material.dart';
import 'package:home_train/components/generic_banner.dart';
import 'package:home_train/constants.dart';
import 'package:fl_chart/fl_chart.dart';

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
    var size = MediaQuery.of(context).size;
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Text("Activity", style: TextStyle(
                        //   fontWeight: FontWeight.w500,
                        //   fontSize: 13,
                        //   color: Colors.black.withOpacity(0.5)
                        // )),
                        // SizedBox(height: 10,
                        // ),
                        Text("Average " + widget.workout + "/day: 13",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                        const SizedBox(height: 10)
                      ]),
                ),
                Container(
                  width: size.width - 20,
                  height: 150,
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
                    // titlesData: FlTitlesData(
                    //   show: true,
                    //   rightTitles: AxisTitles(
                    //     sideTitles: SideTitles(showTitles: false),
                    //   ),
                    //   topTitles: AxisTitles(
                    //     sideTitles: SideTitles(showTitles: false),
                    //   ),
                    //   bottomTitles: AxisTitles(
                    //     sideTitles: SideTitles(
                    //       showTitles: true,
                    //       reservedSize: 30,
                    //       interval: 1,
                    //       getTitlesWidget: bottomTitleWidgets,
                    //     ),
                    //   ),
                    //   leftTitles: AxisTitles(
                    //     sideTitles: SideTitles(
                    //       showTitles: true,
                    //       interval: 1,
                    //       getTitlesWidget: leftTitleWidgets,
                    //       reservedSize: 42,
                    //     ),
                    //   ),
                    // ),
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
                        spots: [
                          FlSpot(0, 3),
                          FlSpot(2.6, 2),
                          FlSpot(4.9, 5),
                          FlSpot(6.8, 3.1),
                          FlSpot(8, 4),
                          FlSpot(9.5, 3),
                          FlSpot(11, 4),
                        ],
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
      SizedBox(height: 20),
      Wrap(
        spacing: 20,
        children: [
          Container(
              width: (size.width - 60) / 2,
              height: 170,
              decoration: BoxDecoration(
                  color: homeTrainBlue,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.01),
                        spreadRadius: 10,
                        blurRadius: 3)
                  ]),
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: homeTrainGreen, shape: BoxShape.circle),
                          child: Icon(Icons.arrow_back, color: Colors.white))
                    ],
                  ))),
          Container(
              width: (size.width - 60) / 2,
              height: 170,
              decoration: BoxDecoration(
                  color: homeTrainGreen,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.01),
                        spreadRadius: 10,
                        blurRadius: 3)
                  ]),
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: homeTrainBlue, shape: BoxShape.circle),
                          child: const Icon(Icons.arrow_forward,
                              color: Colors.white))
                    ],
                  ))),
        ],
      )
    ]));
  }
}

//TODO: Generalize to show all users' stats