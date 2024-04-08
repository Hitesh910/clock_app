import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime time = DateTime.now();
  GlobalKey<ScaffoldState> scafoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getTime();
  }

  bool isDigital = true;
  bool isAnalog = false;
  bool isStrap = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scafoldkey,
        backgroundColor: const Color(0xff222c39),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              scafoldkey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          title: const Text("Clock App"),
          backgroundColor: const Color(0xff222c39),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isDigital,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 230,
                          width: 230,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("asets/Image/background.jpg"),
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
                  Visibility(
                    visible: isAnalog,
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 400,
                            child: Container(
                              height: 600,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("asets/Image/clock3.jpeg"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 250,
                            child: Container(
                              height: 400,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage("asets/Image/background4.png"),
                                ),
                              ),
                            ),
                          ),
                          Stack(
                            children: List.generate(
                              60,
                              (index) => Transform.rotate(
                                angle: (pi * 2 * index) / 60,
                                child: Divider(
                                  color: Colors.black,
                                  endIndent: index % 5 == 0
                                      ? MediaQuery.sizeOf(context).width * 0.95
                                      : MediaQuery.sizeOf(context).width * 0.98,
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
                                endIndent:
                                    MediaQuery.sizeOf(context).width * 0.50,
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
                                endIndent:
                                    MediaQuery.sizeOf(context).width * 0.50,
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
                                endIndent:
                                    MediaQuery.sizeOf(context).width * 0.50,
                                thickness: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isStrap,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 230,
                          width: 230,
                          child: CircularProgressIndicator(
                            value: time.hour * 1 / 12,
                            strokeWidth: 15,
                            color: Colors.blue,
                            backgroundColor: Colors.blue.withOpacity(0.2),
                            strokeCap: StrokeCap.round,
                          ),
                        ),
                        Container(
                          height: 280,
                          width: 280,
                          child: CircularProgressIndicator(
                            value: time.minute * 1 / 60,
                            strokeWidth: 15,
                            color: Colors.green,
                            backgroundColor: Colors.green.withOpacity(0.2),
                            strokeCap: StrokeCap.round,
                          ),
                        ),
                        Container(
                          height: 330,
                          width: 330,
                          child: CircularProgressIndicator(
                            value: time.second * 1 / 60,
                            strokeWidth: 15,
                            color: Colors.pink,
                            backgroundColor: Colors.pink.withOpacity(0.2),
                            strokeCap: StrokeCap.round,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Tue",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 32),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${time.day}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                const Text(
                                  "/",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "${time.year}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 70,
                                  width: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Colors.green, Colors.blue],
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    "${time.hour}",
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                const Text(
                                  " : ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 50),
                                ),
                                Container(
                                  height: 70,
                                  width: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Colors.green, Colors.blue],
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    "${time.minute}",
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "28",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "°C",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: Image(
                      image: AssetImage("asets/Image/profile2.png"),
                      fit: BoxFit.fill),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Digital Clock",
                      style: TextStyle(fontSize: 25),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isAnalog = false;
                          isDigital = true;
                          isStrap = false;
                        });
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple.shade400),
                      ),
                      child: const Text(
                        "On",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Analog Clock",
                      style: TextStyle(fontSize: 25),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isAnalog = true;
                          isDigital = false;
                          isStrap = false;
                        });
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple.shade400),
                      ),
                      child: const Text(
                        "On",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Strap Clock",
                      style: TextStyle(fontSize: 25),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isAnalog = false;
                          isDigital = false;
                          isStrap = true;
                        });
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple.shade400),
                      ),
                      child: const Text(
                        "On",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
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
