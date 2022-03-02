import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_train/constants.dart' as constants;

class HomeBanner extends StatefulWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  _HomeBanner createState() => _HomeBanner();
}

class _HomeBanner extends State<HomeBanner> {
  @override
  Widget build(BuildContext context) {
    double width_ = MediaQuery.of(context).size.width;
    double height_ = MediaQuery.of(context).size.height;
    return Container(
      height: 300,
      // color: Color.fromARGB(255, 255, 0, 0),
      child: Stack(children: <Widget>[
        Container(
          color: constants.homeTrainBlue,
          width: width_,
          height: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildTitle(),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 150,
          right: 0,
          child: SvgPicture.asset(
            "images/man_workout.svg",
            height: 150,
          ),
        ),
      ]),
    );
  }
}

Widget _buildTitle() {
  return Center(
    child: Container(
      child: Column(
        children: const <Widget>[
          Text(
            "Let's HomeTrain 🔥",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 40,
            ),
            // textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
