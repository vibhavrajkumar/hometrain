import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:home_train/screens/home_screen.dart';
import 'package:home_train/constants.dart' as constants;

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbar();
}

class _BottomNavbar extends State<BottomNavbar> {
  static const platform = MethodChannel('hometrain.test/battery');
  static String _batteryLevel = 'Unknown battery level.';

  // static String getBatteryState => _batteryLevel;

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    // print(batteryLevel);
    setState(() {
      _batteryLevel = batteryLevel;
      print(_batteryLevel);
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  //Place holder for what goes in body
   static List<Widget> _widgetOptions = <Widget>[
    Text(
      _batteryLevel,
      style: optionStyle,
    ),
    HomeScreen(),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    _getBatteryLevel();
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
