import 'package:flutter/material.dart';

import 'screens/InputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0A0E21),
        accentColor: Colors.purple,
      ),
      home: InputPage(),
    );
  }
}
