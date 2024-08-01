import 'package:flutter/material.dart';
import 'package:prayer/values/colors.dart';

AppBar listPageAppBar(String title, BuildContext context) {
  return AppBar(
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
          Expanded(
              child: Text(
            title,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          )),
          const SizedBox(
            width: 25,
          )
        ],
      ));
}
