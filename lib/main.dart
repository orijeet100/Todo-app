import 'package:flutter/material.dart';
import 'Screens/Task_screen.dart';
import 'package:provider/provider.dart';

import 'models/tasks.dart';

void main() {
  runApp(ChangeNotifierProvider<TaskData>(
      create:(context)=>TaskData(),
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: TaskScreen(),
        ),
      );
  }
}

