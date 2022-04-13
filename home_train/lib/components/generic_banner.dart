import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_train/constants.dart' as constants;

class GenericBanner extends StatefulWidget {
  const GenericBanner({Key? key}) : super(key: key);

  @override
  _GenericBanner createState() => _GenericBanner();
}

class _GenericBanner extends State<GenericBanner> {
  @override
  Widget build(BuildContext context) {
    //Returns top banner of home page
    return _buildBanner(context);
  }
}

//Builds top blue box with text
Widget _buildBanner(BuildContext context) {
  double width_ = MediaQuery.of(context).size.width;
  double height_ = MediaQuery.of(context).size.height;
  return Container(
    decoration: const BoxDecoration(color: constants.homeTrainGreen),
    width: width_,
    height: height_ / 3,
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
          "Let's Analyze!",
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
