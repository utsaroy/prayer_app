import 'package:flutter/material.dart';
import 'package:prayer/pages/home_page.dart';
import 'package:prayer/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prayer App',
      theme: myTheme,
      darkTheme: myTheme,
      home: const HomePage(),
    );
  }
}
