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
    //Returns top banner of home page
    return Container(
      height: 300,
      child: Stack(children: <Widget>[
        //Builds top blue box with text
        _buildBanner(context),
        //Builds image of man working out
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

//Builds top blue box with text
Widget _buildBanner(BuildContext context) {
  double width_ = MediaQuery.of(context).size.width;
  return Container(
    decoration: const BoxDecoration(color: constants.homeTrainBlue),
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
  );
}

//Builds title for top banner
Widget _buildTitle() {
  return Center(
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
  );
}
