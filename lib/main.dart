import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'task_progress_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskProgressScreen(),
    );
  }
}
