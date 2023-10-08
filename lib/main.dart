import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:progressbar2/task_liner_progress.dart';
import 'task_circular_progress_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskProgressScreen2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
