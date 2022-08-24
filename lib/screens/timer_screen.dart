import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

class TimerScree extends StatefulWidget {
  const TimerScree({Key? key}) : super(key: key);

  @override
  State<TimerScree> createState() => _TimerScreeState();
}

class _TimerScreeState extends State<TimerScree> {
  List timersList = [];
  List countingList = [];
  Timer? timer;
  int randomNum = 0;
  Random randomTimer = Random();
  dynamic Values;
  dynamic Indexes;
  int _count = 0;

  bool timerOn = true;
  bool Paused = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TIMERS LIST"),
          centerTitle: false,
        ),
        body: ListView.builder(
          itemCount: timersList.length,
          itemBuilder: (context, int index) {
            // print(index);
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Timer ${index}",
                                style: const TextStyle(color: Colors.black),
                              ),
                              Text(
                                timersList[index].toString(),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 10,
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total:${timersList.length} "),
              FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  creatingTimer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  creatingTimer() {
    randomNum = randomTimer.nextInt(50);
    timersList.add(randomNum);
    var makingMap = timersList.asMap();
    makingMap.forEach((key, value) {
      Indexes = key;
      Values = value;
    });

    reducingNum(Indexes, Values);
  }

  reducingNum(Indexes, Values) async {
    print("This is the values inside ${timersList[Indexes]}");
    timer = Timer.periodic(const Duration(seconds: 1), (Timer) async {
      Timer.isActive;
      if (timerOn == true) {
        await timersList[Indexes]--;
        if (timersList.length > 3) {
          // timersList.where((element) {
          //   var ad = element > 3;
          //   print("This is the first $ad");
          //   return ad;
          // });
        }
        if (timersList[Indexes] == 0) {
          timersList.removeAt(Indexes);
        }
      } else {
        timerOn = false;
        timersList[Indexes] == "Paused";
        Timer.cancel();
      }

      setState(() {
        timersList;
      });
      // timersList[gettingIndex] = lastNum;
    });

    // print(timersList.asMap());
    // var asdf = timersList.asMap();
    // asdf.forEach((key, value) {
    //   timersList.indexWhere((element) {
    //     element == key;
    //     return value + 1;
    //   });
    //   print(key);
    //   print("This is the key $key");
    // });
    // if (timersList != null) {
    //   setState(() {
    //     index;
    //   });
    //   print(index);
    //   // for (element in timersList.indexOf(index)) {
    //   //   timer = Timer.periodic(const Duration(seconds: 1), (_) {
    //   //     // timersList.add(randomNum);
    //   //     // setState(() => element--);
    //   //     randomNum = element;
    //   //     // setState(() {
    //   //     //   randomNum = element--;
    //   //     //   timersList.add(randomNum);
    //   //     // });
    //   //     print(element);
    //   //   });
    //   // }
    // }
  }
}
