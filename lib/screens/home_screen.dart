import 'package:flutter/material.dart';
import 'package:timer/screens/timer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NEW TIMER",
        ),
        centerTitle: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),
          child: const Text(
            "Start Random Timer",
            style: TextStyle(fontSize: 12),
          ),
          onPressed: () {
            Route route = MaterialPageRoute(builder: (c) => const TimerScree());
            Navigator.pushReplacement(context, route);
          },
        ),
      ),
    );
  }
}
