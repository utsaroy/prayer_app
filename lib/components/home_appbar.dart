import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:prayer/data/time_data.dart';
import 'package:prayer/services/bangla_date.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 15, right: 20, bottom: 5),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 61, 45, 150),
              offset: Offset(0, 1),
              blurRadius: 8,
            )
          ],
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 42, 7, 107),
            Color.fromARGB(255, 93, 69, 226)
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LottieBuilder.asset(
            "assets/animations/flower_round.json",
            width: 40,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getDayName(),
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                ),
                Text(
                  getBanglaDate(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 198, 42, 138), fontSize: 16),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(212, 63, 46, 159),
                border: Border.all(
                    color: const Color.fromARGB(255, 93, 69, 226), width: 1),
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              getPrayerTime(0)[0],
              style: const TextStyle(
                  color: Color.fromARGB(255, 241, 240, 246),
                  fontSize: 20,
                  fontFamily: "Outfit"),
            ),
          )
        ],
      ),
    );
  }
}
