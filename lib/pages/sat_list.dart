import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prayer/data/satya_data.dart';
import 'package:prayer/pages/view_content.dart';
import 'package:prayer/services/getter_functions.dart';
import 'package:prayer/values/colors.dart';

class SatList extends StatelessWidget {
  const SatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          leading: Container(
            margin: const EdgeInsets.only(left: 15),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
          ),
          backgroundColor: appBarColor,
          title: Row(
            children: [
              const Expanded(
                  child: Text(
                "সত্যানুস্মরন",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )),
              IconButton(
                  onPressed: () {
                    int rand = Random().nextInt(satTitles.length);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ViewContent(
                          title: satTitles[rand],
                          indx: rand,
                          contentGetter: getSatyaContent);
                    }));
                  },
                  icon: const Icon(Icons.shuffle_rounded, color: Colors.white))
            ],
          )),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: satTitles.length,
            itemBuilder: (context, indx) => Container(
              margin: const EdgeInsets.all(5),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(50),
              //     gradient: LinearGradient(colors: [
              //       Color.fromARGB(255, 34, 2, 82),
              //       Color.fromARGB(255, 169, 60, 232)
              //     ])),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                splashColor: Colors.blue,
                tileColor: const Color.fromARGB(255, 65, 61, 188),
                title: Text(
                  satTitles[indx],
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewContent(
                              title: satTitles[indx],
                              indx: indx,
                              contentGetter: getSatyaContent)));
                },
              ),
            ),
          )),
    );
  }
}

/*

Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 34, 2, 82),
                          Color.fromARGB(255, 169, 60, 232)
                        ])),
                    child: 

*/