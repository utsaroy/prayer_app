import 'package:flutter/material.dart';

class ContentTile extends StatelessWidget {
  final String title, textContent;
  final String? author;
  final double textSize;
  final bool? isDarkMode;
  const ContentTile(
      {super.key,
      required this.title,
      required this.textContent,
      this.author,
      required this.textSize,
      this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              color: const Color.fromARGB(255, 193, 95, 241),
              fontSize: textSize + 5),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            textContent,
            style: TextStyle(
                color: (isDarkMode != null)
                    ? Colors.white
                    : const Color.fromARGB(255, 2, 0, 27),
                fontSize: textSize),
            textAlign: TextAlign.center,
          ),
        ),
        (author != null)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    author ?? "",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 182, 80, 222),
                        fontSize: textSize > 10 ? textSize - 5 : 10),
                  ),
                ],
              )
            : const SizedBox()
      ],
    );
  }
}
