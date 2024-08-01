import 'package:flutter/material.dart';

class TimeTile extends StatelessWidget {
  final String time;
  final bool isMorning;
  const TimeTile({super.key, required this.time, required this.isMorning});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(58, 38, 102, 1),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 175, 23, 170),
                offset: Offset(0, 5),
                blurRadius: 10,
                spreadRadius: -5)
          ],
          borderRadius: BorderRadius.circular(50)),
      height: 120,
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(236, 215, 60, 0.849),
                    Color.fromRGBO(214, 21, 134, 0.827),
                    Color.fromRGBO(128, 18, 238, 0.833)
                  ]),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 12, 6, 95),
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        spreadRadius: -2)
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Image.asset(
                      (isMorning)
                          ? "assets/images/sun.png"
                          : "assets/images/sunset.png",
                      cacheHeight: 200,
                      cacheWidth: 200,
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Color.fromRGBO(53, 4, 33, 0.171)))),
                      child: Text(
                        (isMorning) ? "morning prayer" : "evening pryer",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(178, 231, 218, 229),
                            fontFamily: "Outfit"),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: "Outfit",
                      shadows: [
                        Shadow(
                            color: Color.fromARGB(255, 10, 24, 101),
                            blurRadius: 8,
                            offset: Offset(0, 1))
                      ]),
                ),
                Text(
                  isMorning ? "am" : "pm",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 199, 199, 199),
                      fontFamily: "Outfit"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
