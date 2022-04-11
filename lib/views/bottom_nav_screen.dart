import 'package:flutter/material.dart';
import 'package:newstorm/views/home_page.dart';
import 'package:newstorm/views/weather_page.dart';

class BottomNavScreen extends StatefulWidget {
  static const routeName = '/Bottom-nav-screen';
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _pages = [
    HomePage(),
    const WeatherPage(),
  ];

  int _currentIndex = 0;

  _onTap(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.feed), label: 'News', tooltip: 'News'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud), label: 'Weather', tooltip: 'Weather'),
        ],
      ),
    );
  }
}
