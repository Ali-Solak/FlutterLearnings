import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/TaskData.dart';
import 'Screens/TasksScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskData(),
        ),
      ],
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
