import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prayer/components/home_appbar.dart';
import 'package:prayer/components/list_tile.dart';
import 'package:prayer/components/time_tile.dart';
import 'package:prayer/data/six_base.dart';
import 'package:prayer/data/time_data.dart';
import 'package:prayer/pages/about_page.dart';
import 'package:prayer/pages/next_time_list.dart';
import 'package:prayer/pages/sat_list.dart';
import 'package:prayer/pages/settings_page.dart';
import 'package:prayer/pages/the_list_page.dart';
import 'package:prayer/pages/view_content.dart';
import 'package:prayer/services/get_time_difference.dart';
import 'package:prayer/services/getter_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pCotroller = PageController();
  bool isFirstPage = true;
  String _timeRemaining = getRemainingDuration();

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    var nextMinute =
        DateTime(now.year, now.month, now.day, now.hour, now.minute + 1);
    Timer(nextMinute.difference(now), () {
      Timer.periodic(const Duration(minutes: 1), (timer) {
        setState(() {
          _timeRemaining = getRemainingDuration();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 11, 3, 33),
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: const Color.fromARGB(255, 60, 44, 150),
        ),
        body: SafeArea(
          child: Column(
            children: [
              //app bar as container
              const HomeAppBar(),
              SizedBox(
                height: 140,
                child: PageView(
                  controller: _pCotroller,
                  onPageChanged: (value) {
                    setState(() {
                      isFirstPage = (value == 0) ? true : false;
                    });
                  },
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: TimeTile(
                                time: getPrayerTime(0)[1], isMorning: true)),
                        Expanded(
                            child: TimeTile(
                                time: getPrayerTime(0)[2], isMorning: false))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TimeTile(
                                time: getPrayerTime(1)[1], isMorning: true)),
                        Expanded(
                            child: TimeTile(
                                time: getPrayerTime(1)[2], isMorning: false))
                      ],
                    ),
                    Center(
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 92, 78, 197))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NextTimesList()));
                        },
                        child: const Text(
                          "Show for next 10 Days",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Outfit"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Time Remaining\n$_timeRemaining",
                      style: const TextStyle(
                          color: Colors.white, fontFamily: "Outfit"),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (isFirstPage) {
                          _pCotroller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        } else {
                          if (_pCotroller.page == 1.0) {
                            _pCotroller.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear);
                          } else {
                            _pCotroller.animateToPage(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Easing.standardAccelerate);
                          }
                        }
                        // _pCotroller.nextPage(
                        //     duration: Durations.long1, curve: Easing.linear);
                      },
                      child: Container(
                        width: 110,
                        height: 36,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 94, 68, 197),
                                offset: Offset(0, 2),
                                blurRadius: 5,
                                spreadRadius: -3)
                          ],
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(40, 15, 103, 1),
                            Color.fromRGBO(42, 2, 74, 1),
                          ]),
                          color: const Color.fromRGBO(41, 7, 80, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: AnimatedOpacity(
                                opacity: isFirstPage ? 0 : 1,
                                duration: Durations.short4,
                                child: const Center(
                                  child: Text(
                                    "Tomorrow ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Outfit"),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              top: 0,
                              child: AnimatedOpacity(
                                opacity: isFirstPage ? 1 : 0,
                                duration: Durations.short4,
                                child: const Center(
                                  child: Text(
                                    "      Today",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Outfit"),
                                  ),
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                              right: isFirstPage ? 0 : 73,
                              child: Stack(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color.fromRGBO(
                                            64, 15, 103, 1.0),
                                      ),
                                      child: const SizedBox(
                                        height: 30,
                                        width: 30,
                                      )),
                                  const Positioned(
                                    top: 0,
                                    bottom: 0,
                                    right: 0,
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        PListTile(
                            title: "প্রার্থনা",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ListPage(
                                          title: 'প্রার্থনা',
                                          getlistItemsFun: getPrayerTitles,
                                          getContentFun: getPrayerContent)));
                            }),
                        PListTile(
                            title: "সত্যানুস্মরন",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SatList()));
                            }),
                        PListTile(
                            title: "মন্ত্র",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ListPage(
                                            title: "সংগীত",
                                            getlistItemsFun: getMantraList,
                                            getContentFun: getMantraContent,
                                          )));
                            }),
                        PListTile(
                            title: "সংগীত",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ListPage(
                                            title: "সংগীত",
                                            getlistItemsFun: getSangeetList,
                                            getContentFun: getSangeetContent,
                                          )));
                            }),
                        PListTile(
                            title: "ষটস্তম্ভ",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewContent(
                                            title: "ষটস্তম্ভ",
                                            indx: 0,
                                            contentGetter: (indx) {
                                              return [
                                                [sixBaseContent]
                                              ];
                                            },
                                          )));
                            }),
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutPage()));
                        },
                        icon: const Icon(
                          Icons.info,
                          color: Color.fromARGB(255, 93, 69, 226),
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingsPage()));
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 93, 69, 226),
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
