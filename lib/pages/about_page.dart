import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:prayer/values/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(100, 89, 19, 117),
        toolbarHeight: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 230,
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(150),
                      bottomRight: Radius.circular(150),
                      // bottomLeft: Radius.circular(150)
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.5),
                                spreadRadius: -5,
                                blurRadius: 5)
                          ],
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(100, 231, 42, 149),
                                Color.fromARGB(100, 89, 19, 117),
                                bgColor,
                                Color.fromARGB(100, 89, 19, 117),
                                Color.fromARGB(100, 231, 42, 149),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0, 0.45, 0.5, 0.55, 1])),
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      // topRight: Radius.circular(150),
                      bottomRight: Radius.circular(150),
                      // bottomLeft: Radius.circular(150)
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(113, 231, 42, 149),
                                bgColor.withOpacity(0.2),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: const [0, 0.75])),
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(150),
                        // bottomRight: Radius.circular(150),
                        bottomLeft: Radius.circular(150)),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.5),
                                spreadRadius: -5,
                                blurRadius: 5)
                          ],
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(100, 231, 42, 149),
                                Color.fromARGB(100, 89, 19, 117),
                                bgColor,
                                Color.fromARGB(100, 89, 19, 117),
                                Color.fromARGB(100, 231, 42, 149),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [0, 0.45, 0.5, 0.55, 1])),
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        // topLeft: Radius.circular(150),
                        // bottomRight: Radius.circular(150),
                        bottomLeft: Radius.circular(150)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(113, 231, 42, 149),
                                bgColor.withOpacity(0.2),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: const [0, 0.75])),
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                SizedBox(
                  height: double.maxFinite,
                  width: double.infinity,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: const SizedBox(
                        height: 230,
                        width: 200,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: ShapeDecoration(
                          shadows: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 233, 30, 138),
                                blurRadius: 20,
                                offset: Offset(0, -10),
                                spreadRadius: -5),
                            BoxShadow(
                                color: Color.fromARGB(255, 155, 76, 224),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                                spreadRadius: -5),
                          ],
                          shape: const HexagonShapeBorder(usePadding: false),
                          color: const Color.fromARGB(255, 137, 137, 137)
                              .withOpacity(0.4)),
                      child: Center(
                        child: Image.asset(
                          "assets/images/flutter_logo.png",
                          height: 100,
                          width: 100,
                          cacheHeight: 120,
                          cacheWidth: 120,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text('App is develped by',
              style: TextStyle(color: Colors.white, fontFamily: "Cookie")),
          const Text('Utsa Roy',
              style: TextStyle(
                  color: Colors.white, fontFamily: "Outfit", fontSize: 23)),
          Expanded(
              flex: 4,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -20,
                    left: 10,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            Colors.blue,
                            Color.fromARGB(255, 214, 48, 173)
                          ])),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 2,
                    child: Container(
                      height: 80,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(colors: [
                            Colors.blue,
                            Color.fromARGB(255, 244, 54, 171)
                          ])),
                    ),
                  ),
                  Center(
                      child: Container(
                          margin: const EdgeInsets.all(35),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: const Color.fromARGB(143, 53, 83, 255),
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignInside),
                          ))),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                        child: Container(
                      height: 15,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 31, 109, 173),
                            blurRadius: 35,
                            spreadRadius: 5)
                      ]),
                    )),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                        child: Container(
                      height: 5,
                      width: 200,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 8, 30, 48),
                            blurRadius: 8,
                            spreadRadius: -1)
                      ]),
                    )),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 120,
                      width: 120,
                      cacheHeight: 150,
                      cacheWidth: 150,
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: double.maxFinite,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(143, 255, 255, 255)
                                .withOpacity(0.1),
                            strokeAlign: BorderSide.strokeAlignOutside),
                        color: const Color.fromARGB(44, 118, 148, 196),
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: SingleChildScrollView(
                                child: getAboutInRichText(),
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    const url =
                        "fb://facewebmodal/f?href=https://www.facebook.com/source.u";
                    launchSocialMediaAppIfInstalled(url: url);
                  },
                  child: Container(
                    decoration: getSocialiconDesign(),
                    child: LottieBuilder.asset(
                        "assets/animations/facebook.json",
                        height: 50,
                        width: 50),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = "https://www.instagram.com/utsaroy3";
                    launchSocialMediaAppIfInstalled(url: url);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: getSocialiconDesign(),
                    child: LottieBuilder.asset("assets/animations/insta.json",
                        height: 30, width: 30),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = "https://www.linkedin.com/in/utsaroy/";
                    launchSocialMediaAppIfInstalled(url: url);
                  },
                  child: Container(
                    decoration: getSocialiconDesign(),
                    child: LottieBuilder.asset(
                      "assets/animations/linkedin.json",
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  RichText getAboutInRichText() {
    return RichText(
      text: const TextSpan(
        children: <TextSpan>[
          TextSpan(
              text:
                  "This simple app is designed to help you stay connected with your spiritual practices. It shows prayer times for the Bangladesh timezone. You can access the Prayer, ",
              style: TextStyle(
                  fontFamily: "Cookie", fontSize: 20, color: Colors.white)),
          TextSpan(
              text: "'সত্যানুস্মরন'",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "SerifBengali",
                  color: Colors.white)),
          TextSpan(
              text: ", along with some ",
              style: TextStyle(
                  fontFamily: "Cookie", fontSize: 20, color: Colors.white)),
          TextSpan(
              text: "'মন্ত্র'",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "SerifBengali",
                  color: Colors.white)),
          TextSpan(
              text: " and ",
              style: TextStyle(
                  fontFamily: "Cookie", fontSize: 20, color: Colors.white)),
          TextSpan(
              text: "'কির্তন'",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "SerifBengali",
                  color: Colors.white)),
          TextSpan(
              text: ". The time data is taken from ",
              style: TextStyle(
                  fontFamily: "Cookie", fontSize: 20, color: Colors.white)),
          TextSpan(
              text: "'সন্দীপনা'",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "SerifBengali",
                  color: Colors.white)),
          TextSpan(
              text: ", and the text data is taken from the ",
              style: TextStyle(
                  fontFamily: "Cookie", fontSize: 20, color: Colors.white)),
          TextSpan(
              text: "'সত্যানুস্মরন'",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "SerifBengali",
                  color: Colors.white)),
          TextSpan(
              text: " and ",
              style: TextStyle(
                  fontFamily: "Cookie", fontSize: 20, color: Colors.white)),
          TextSpan(
              text: "'জীবনচর্য্যা'",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "SerifBengali",
                  color: Colors.white)),
          TextSpan(
              text: " books. A special thanks to ",
              style: TextStyle(
                  fontFamily: "Cookie", fontSize: 20, color: Colors.white)),
          TextSpan(
              text: "Snigdho",
              style: TextStyle(
                  fontFamily: "Outfit", fontSize: 17, color: Colors.white)),
          TextSpan(
              text: " and ",
              style: TextStyle(
                  fontFamily: "Cookie", fontSize: 22, color: Colors.white)),
          TextSpan(
              text: "Dibya",
              style: TextStyle(
                  fontFamily: "Outfit", fontSize: 17, color: Colors.white)),
          TextSpan(
              text:
                  " for their invaluable assistance in data collection and verification. We have tried our best for accuracy, but please pardon any mistakes. For any feedback or inquiries, feel free to contact me through the social links provided below. Thank you.",
              style: TextStyle(
                  fontFamily: "Cookie", fontSize: 20, color: Colors.white)),
        ],
      ),
    );
  }

  Future<void> launchSocialMediaAppIfInstalled({
    required String url,
  }) async {
    try {
      bool launched = await launchUrlString(url,
          mode: LaunchMode.externalNonBrowserApplication);
      if (!launched) {
        launchUrlString(url); // Launch web view if app is not installed!
      }
    } catch (_) {}
  }

  BoxDecoration getSocialiconDesign() {
    return BoxDecoration(
        color: Colors.blue.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 231, 42, 149),
              blurRadius: 5,
              spreadRadius: -1,
              offset: Offset(-2, -2)),
          BoxShadow(
              color: Color.fromARGB(255, 53, 158, 219),
              blurRadius: 5,
              spreadRadius: -1,
              offset: Offset(2, 2))
        ]);
  }
}

class HexagonShapeBorder extends ShapeBorder {
  final bool usePadding;

  const HexagonShapeBorder({required this.usePadding});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double width = rect.width;
    // final double height = rect.height;
    final double sideLength = width / 2;
    final double centerX = rect.center.dx;
    final double centerY = rect.center.dy;

    return Path()
      ..moveTo(centerX + sideLength * cos(-pi / 2),
          centerY + sideLength * sin(-pi / 2))
      ..lineTo(centerX + sideLength * cos(-pi / 2 + pi / 3),
          centerY + sideLength * sin(-pi / 2 + pi / 3))
      ..lineTo(centerX + sideLength * cos(-pi / 2 + 2 * pi / 3),
          centerY + sideLength * sin(-pi / 2 + 2 * pi / 3))
      ..lineTo(centerX + sideLength * cos(-pi / 2 + pi),
          centerY + sideLength * sin(-pi / 2 + pi))
      ..lineTo(centerX + sideLength * cos(-pi / 2 + 4 * pi / 3),
          centerY + sideLength * sin(-pi / 2 + 4 * pi / 3))
      ..lineTo(centerX + sideLength * cos(-pi / 2 + 5 * pi / 3),
          centerY + sideLength * sin(-pi / 2 + 5 * pi / 3))
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}
}
