import 'package:flutter/material.dart';
import 'package:prayer/data/time_data.dart';
import 'package:prayer/services/bangla_date.dart';
import 'package:prayer/values/colors.dart';

class NextTimesList extends StatelessWidget {
  const NextTimesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: const Color.fromARGB(255, 42, 7, 107),
        ),
        body: Column(children: [
          //app bar as container
          Container(
            padding:
                const EdgeInsets.only(top: 5, left: 5, right: 25, bottom: 5),
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 42, 7, 107),
              Color.fromARGB(255, 93, 69, 226)
            ])),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getDayName(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(
                        getBanglaDate(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 198, 42, 138),
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(212, 63, 46, 159),
                      border: Border.all(
                          color: const Color.fromARGB(255, 93, 69, 226),
                          width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    getPrayerTime(0)[0],
                    style: const TextStyle(
                        color: Color.fromARGB(255, 243, 243, 243),
                        fontFamily: "Outfit",
                        fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: const Color.fromARGB(255, 32, 5, 82),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Date",
                  style: TextStyle(color: Colors.white, fontFamily: "Outfit"),
                ),
                Text(
                  "Morning",
                  style: TextStyle(color: Colors.white, fontFamily: "Outfit"),
                ),
                Text(
                  "Evening",
                  style: TextStyle(color: Colors.white, fontFamily: "Outfit"),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, indx) => Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                            border: Border(
                                top: (indx == 0)
                                    ? const BorderSide(color: Colors.white)
                                    : BorderSide.none,
                                bottom: const BorderSide(color: Colors.white))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              getPrayerTime(indx)[0],
                              style: const TextStyle(
                                  color: Colors.white, fontFamily: "Outfit"),
                            ),
                            Text(
                              "${getPrayerTime(indx)[1]} am",
                              style: const TextStyle(
                                  color: Colors.white, fontFamily: "Outfit"),
                            ),
                            Text(
                              "${getPrayerTime(indx)[2]} pm",
                              style: const TextStyle(
                                  color: Colors.white, fontFamily: "Outfit"),
                            )
                          ],
                        ),
                      )))
        ]));
  }
}
