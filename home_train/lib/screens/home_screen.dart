import 'package:flutter/material.dart';
import 'package:home_train/components/workout_scroll.dart';
import 'package:home_train/components/home_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [HomeBanner(), WorkoutScroll()],
    );
  }
}
