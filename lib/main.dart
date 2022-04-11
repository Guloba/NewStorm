import 'package:flutter/material.dart';
import 'package:newstorm/views/bottom_nav_screen.dart';
import 'package:newstorm/views/home_page.dart';
import 'package:newstorm/views/weather_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewStorm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const BottomNavScreen(),
      routes: {
         BottomNavScreen.routeName: (ctx) => const BottomNavScreen(),
         HomePage.routeName: (ctx) => const HomePage(),
         WeatherPage.routeName: (ctx) => const WeatherPage(),
      },
    );
  }
}
