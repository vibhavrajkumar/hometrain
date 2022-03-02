import 'package:flutter/material.dart';
import 'package:home_train/screens/home_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbar();
}

class _BottomNavbar extends State<BottomNavbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  //Not needed just place holder for what goes in body
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 1: Workouts',
      style: optionStyle,
    ),
    HomeScreen(),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            icon: Image.asset('images/HomeTrainLogo.png'),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 58, 146),
        onTap: _onItemTapped,
      ),
    );
  }
}
