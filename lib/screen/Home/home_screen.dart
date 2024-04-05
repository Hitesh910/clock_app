import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime time = DateTime.now();

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff222c39),
        body: Column(
              children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 35,
                    width: 75,
                    margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      "Clock",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  const Text(
                    "World Clock",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 15,),
                  const Text(
                  "StopWatch",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 15,),
                  const Text(
                    "Alarm",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 15,),
                ],
              ),
            ),
            // Transform.translate(
            //   offset: const Offset(5, 235 ),
            Transform.translate(
              offset: Offset(5,150),
              child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 230,
                        width: 230,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("asets/Image/background.jpg"),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${time.hour} : ${time.minute} : ${time.second}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                            ),
                            Text(
                              "${time.day} / ${time.month} / ${time.year}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Transform.scale(
                        scale: 6,
                        child: CircularProgressIndicator(
                          value: time.second / 60,
                          strokeWidth: 1.8,
                          strokeCap: StrokeCap.round,
                          color: const Color(0xff00bed6),
                          backgroundColor: const Color(0xff114967),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(75, 70),
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.red,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // Container(
                //   height: 100,
                //   width: 100,
                //   decoration:
                //       const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                //   child: Row(
                //       children: List.generate(
                //     12,
                //     (index) => Transform.rotate(
                //       angle: ((pi * 2) * index) / 12,
                //       child: Text(
                //         "$index",
                //         style: const TextStyle(color: Colors.indigo, fontSize: 25),
                //       ),
                //     ),
                //   )),
                // ),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 400,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("asets/Image/AnalogClock4.jpg"),
                              fit: BoxFit.cover
                            )),
                      ),
                      Stack(
                        children: List.generate(
                          60,
                          (index) => Transform.rotate(
                            angle: (pi * 2 * index) / 60,
                            child: Divider(
                              color: Colors.white,
                              endIndent: index % 5 == 0
                                  ? MediaQuery.sizeOf(context).width * 0.90
                                  : MediaQuery.sizeOf(context).width * 0.95,
                              thickness: 2,
                            ),
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: pi / 2,
                        child: Transform.rotate(
                          angle: (pi * 2 * time.hour) / 12,
                          child: Divider(
                            color: Colors.green,
                            indent: 80,
                            endIndent: MediaQuery.sizeOf(context).width * 0.50,
                            thickness: 8,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: pi / 2,
                        child: Transform.rotate(
                          angle: (pi * 2 * time.minute) / 60,
                          child: Divider(
                            color: Colors.red,
                            indent: 40,
                            endIndent: MediaQuery.sizeOf(context).width * 0.50,
                            thickness: 5,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: pi / 2,
                        child: Transform.rotate(
                          angle: (pi * 2 * time.second) / 60,
                          child: Divider(
                            color: Colors.amber,
                            endIndent: MediaQuery.sizeOf(context).width * 0.50,
                            thickness: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
          ),
        ),
            ),
      ]
        )
      ),
    );
  }

  void getTime() {
    setState(() {
      time = DateTime.now();
    });

    Future.delayed(
      const Duration(seconds: 1),
      () {
        getTime();
      },
    );
  }
}
