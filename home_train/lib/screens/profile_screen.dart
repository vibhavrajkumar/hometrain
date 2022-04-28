import 'package:flutter/material.dart';
import 'package:home_train/components/generic_banner.dart';
import 'package:home_train/constants.dart';

/*
  Screen for displaying the user's Profile.

  @params:
  TODO: ADD PROFILE FEATURES
*/
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

/*
  Current "Dummy State" for pulling up a Profile page
*/
class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: const [
      GenericBanner(
        homeTrainGreen,
        text: "Let's Profile!",
      ),
      //TextButton(onPressed: () {Navigator.pop(context);}, child: Container()),
    ]));

    //TODO: Add Profile Display/Info
  }
}
