import 'package:flutter/material.dart';

class PListTile extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const PListTile({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.maxFinite,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(64, 70, 37, 201),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(2, 3),
              ),
              BoxShadow(
                color: Color.fromARGB(255, 76, 25, 170),
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(-2, -2),
              )
            ],
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 42, 7, 107),
              Color.fromARGB(255, 93, 69, 226)
            ]),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
