import 'package:flutter/material.dart';
import 'inputpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor:  Color(0XFF0A0E21),
        appBarTheme: AppBarTheme(color: Color(0XFF0A0E21),
         ),
      ),
      home:InputPage(),

    );
  }
}

