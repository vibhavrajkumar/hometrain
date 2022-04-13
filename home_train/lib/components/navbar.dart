import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:home_train/screens/home_screen.dart';
import 'package:home_train/constants.dart' as constants;
import 'package:home_train/screens/workout_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbar();
}

class _BottomNavbar extends State<BottomNavbar> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  /*
    This section creates 
  */
  static final List<Widget> _widgetOptions = <Widget>[
    const WorkoutScreen(),
    const HomeScreen(),
    const Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /*
    Creates a navbar with three sections: Workout, Home, and Profile
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //update what goes in body here
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.assessment_outlined),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/HomeTrainLogo.png"),
            // icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: constants.homeTrainBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}
