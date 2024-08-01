import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prayer/components/content_tile.dart';
import 'package:prayer/pages/settings_page.dart';
import 'package:prayer/values/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef ContentFun = List<List<String>> Function(int indx);

class ViewContent extends StatefulWidget {
  final ContentFun contentGetter;
  final String title;
  final int indx;
  const ViewContent(
      {super.key,
      required this.title,
      required this.indx,
      required this.contentGetter});

  @override
  State<ViewContent> createState() => _ViewContentState();
}

class _ViewContentState extends State<ViewContent> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late double _textSize, _baseScaleFactor;
  late int _playSpeed;
  late bool _darkMode, _isPlaying;
  late final ScrollController _sController;

  Future<void> getPrefsData() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _darkMode = prefs.getBool('darkMode') ?? true;
      _playSpeed = prefs.getInt('playSpeed') ?? 10;
      _textSize = prefs.getDouble('textSize') ?? 20;
    });
  }

  void playText() {
    setState(() {
      _isPlaying = true;
    });
    int duration =
        (_sController.position.maxScrollExtent - _sController.offset) ~/
            (_playSpeed);
    Duration dur = (duration < 1)
        ? const Duration(milliseconds: 50)
        : Duration(seconds: duration);
    _sController
        .animateTo(_sController.position.maxScrollExtent,
            duration: dur, curve: Curves.linear)
        .then((value) {
      if (_isPlaying) {
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  void pauseText() {
    if (_isPlaying) {
      _sController.jumpTo(_sController.offset);
      setState(() {
        _isPlaying = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _sController = ScrollController();
    _textSize = 20;
    _baseScaleFactor = 1.0;
    _playSpeed = 10;
    _darkMode = true;
    _isPlaying = false;
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
      backgroundColor: _darkMode ? bgColor : lightModeColor,
      appBar: getContentViewAppbar(context),
      body: GestureDetector(
        onTapDown: (details) {
          pauseText();
        },
        onPanDown: (details) {
          pauseText();
        },
        onScaleStart: (details) {
          _baseScaleFactor = _textSize;
        },
        onScaleUpdate: (details) {
          setState(() {
            _textSize = min(60, max(10, _baseScaleFactor * details.scale));
          });
        },
        child: ListView(
            controller: _sController,
            cacheExtent: 99999,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              const SizedBox(
                height: 30,
              ),
              for (var i in widget.contentGetter(widget.indx))
                (i.length == 3)
                    ? ContentTile(
                        title: i[0],
                        textContent: i[1],
                        author: i[2],
                        textSize: _textSize,
                        isDarkMode: _darkMode ? true : null,
                      )
                    : (i.length == 2)
                        ? ContentTile(
                            title: '',
                            textContent: i[0],
                            author: i[1],
                            textSize: _textSize,
                            isDarkMode: _darkMode ? true : null)
                        : ContentTile(
                            title: '',
                            textContent: i[0],
                            textSize: _textSize,
                            isDarkMode: _darkMode ? true : null),
              const SizedBox(
                height: 30,
              )
            ]),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          if (_isPlaying) {
            pauseText();
          } else {
            playText();
          }
        },
        icon: _isPlaying
            ? const Icon(Icons.pause_rounded)
            : const Icon(Icons.play_arrow_rounded),
        color: const Color.fromARGB(255, 205, 7, 255),
      ),
    );
  }

  AppBar getContentViewAppbar(BuildContext context) {
    return AppBar(
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
            Expanded(
                child: Text(
              widget.title,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => const SettingsPage())).then((value) {
                    getPrefsData();
                    if (_isPlaying == true) {
                      pauseText();
                    }
                  });
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ))
          ],
        ));
  }
}
