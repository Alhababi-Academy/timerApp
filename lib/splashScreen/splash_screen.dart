import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashScreen();
    super.initState();
  }

  Future splashScreen() async {
    Timer(const Duration(seconds: 3), () {
      Route route = MaterialPageRoute(builder: (C) => const HomeScreen());
      Navigator.push(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text(
          "Timer App, Wlcome",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
