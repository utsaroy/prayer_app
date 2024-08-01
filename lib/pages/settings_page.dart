import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prayer/data/sangeet_data.dart';
import 'package:prayer/values/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  double _textSize = 20;
  double _sliderVal = 0.2;
  int _playSpeed = 10;
  double _playSliderVal = 0.1;
  bool _isDarkSelected = true;

  final _sController = ScrollController();
  bool _isPlaying = false;

  void playText() {
    int duration =
        (_sController.position.maxScrollExtent - _sController.offset) ~/
            (_playSpeed);
    if (duration < 1) duration = 1;
    Duration dur = (duration < 1)
        ? const Duration(milliseconds: 50)
        : Duration(seconds: duration);
    _sController
        .animateTo(_sController.position.maxScrollExtent,
            duration: dur, curve: Curves.linear)
        .then((value) {
      if (_isPlaying) _sController.jumpTo(0);
      setState(() {
        _isPlaying = false;
      });
    });
  }

  Future<void> savePrefsData() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('darkMode', _isDarkSelected);
    prefs.setInt('playSpeed', _playSpeed);
    prefs.setDouble('textSize', _textSize);
  }

  Future<void> getPrefsData() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _isDarkSelected = prefs.getBool('darkMode') ?? true;
      _playSpeed = prefs.getInt('playSpeed') ?? 10;
      _textSize = prefs.getDouble('textSize') ?? 20;
      _sliderVal = _textSize / 100;
      _playSliderVal = _playSpeed / 100;
    });
  }

  @override
  void initState() {
    super.initState();
    getPrefsData();
  }

  @override
  void dispose() {
    _isPlaying = false;
    _sController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(
            margin: const EdgeInsets.only(left: 15),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white)),
          ),
          backgroundColor: appBarColor,
          title: Row(
            children: [
              const Expanded(
                  child: Text(
                "Settings",
                style: TextStyle(color: Colors.white, fontFamily: "Outfit"),
                textAlign: TextAlign.center,
              )),
              IconButton(
                  onPressed: () {
                    savePrefsData()
                        .then((value) => Navigator.pop(context, true));
                  },
                  icon: const Icon(
                    Icons.done_rounded,
                    color: Colors.white,
                  ))
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 29, 94, 178),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Set Default Text Size ($_textSize)",
                      style: const TextStyle(
                          color: Colors.white, fontFamily: "Outfit"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: _isDarkSelected ? bgColor : Colors.white,
                      child: Center(
                        child: Text(
                          "আমার বলাগুলি যদি তোমার-\nশুধু কথা ও চিন্তারই খোরাক মাত্র",
                          style: TextStyle(
                              color:
                                  _isDarkSelected ? Colors.white : Colors.black,
                              fontSize: _textSize),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Slider(
                divisions: 50,
                secondaryTrackValue: 0.2,
                min: 0.1,
                max: 0.6,
                value: _sliderVal,
                onChanged: (val) {
                  setState(() {
                    _sliderVal = val;
                    _textSize = (val * 100).toInt().toDouble();
                  });
                }),
            const SizedBox(height: 20),
            Container(
              height: 120,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              width: double.infinity,
              color: const Color.fromARGB(255, 46, 112, 218),
              child: Column(
                children: [
                  const Text(
                    "Select Text Background Color",
                    style: TextStyle(color: Colors.white, fontFamily: "Outfit"),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isDarkSelected = false;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(
                                        _isDarkSelected ? 0 : 255,
                                        222,
                                        37,
                                        157),
                                    width: 5),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isDarkSelected = true;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(
                                        _isDarkSelected ? 255 : 0,
                                        222,
                                        37,
                                        157),
                                    width: 5),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        )
                      ],
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              width: double.infinity,
              color: const Color.fromARGB(255, 46, 112, 218),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Set Text Playback Speed ($_playSpeed)",
                      style: const TextStyle(
                          color: Colors.white, fontFamily: "Outfit"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: _isDarkSelected ? bgColor : Colors.white,
                      child: Stack(children: [
                        Center(
                          child: SingleChildScrollView(
                            controller: _sController,
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  sangeetContentList[1][1],
                                  style: TextStyle(
                                      color: _isDarkSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: _textSize),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 120,
                                )
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: IconButton(
                              onPressed: () {
                                if (_isPlaying) {
                                  setState(() {
                                    _isPlaying = false;
                                    _sController.jumpTo(_sController.offset);
                                  });
                                } else {
                                  setState(() {
                                    _isPlaying = true;
                                  });
                                  playText();
                                }
                              },
                              icon: Icon(
                                _isPlaying
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded,
                                color: _isPlaying
                                    ? const Color.fromARGB(100, 255, 23, 73)
                                    : const Color.fromARGB(255, 55, 182, 255),
                              )),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Slider(
                secondaryTrackValue: 0.1,
                divisions: 100,
                min: 0.01,
                value: _playSliderVal,
                onChanged: (val) {
                  setState(() {
                    _playSliderVal = val;
                    _playSpeed = (val * 100).toInt();
                    _isPlaying = false;
                  });

                  _sController.jumpTo(_sController.offset);
                }),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
