import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class TaskProgressScreen2 extends StatelessWidget {
  const TaskProgressScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Progress'),
      ),
      body: const ProgressWidget(),
    );
  }
}

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({super.key});

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget>
    with SingleTickerProviderStateMixin {
  // The number of completed tasks
  int _completedTasks = 0;

  // The confetti controller
  late ConfettiController _confettiController;

  // The animation controller for the progress indicator
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();

    // Initialize the confetti controller
    _confettiController = ConfettiController();

    // Initialize the animation controller for the progress indicator
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.0,
      upperBound: 1.0,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _confettiController.dispose();

    // Dispose the animation controller for the progress indicator
    _progressController.dispose();

    super.dispose();
  }

  // Updates the task progress
  void updateProgress() {
    setState(() {
      _completedTasks == 22 ? _completedTasks = 22 : _completedTasks++;
    });

    _progressController.value = _completedTasks / 22;

    if (_completedTasks >= 22) {
      // Show the confetti blast
      _confettiController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            height: 40,
            child: LiquidLinearProgressIndicator(
              borderWidth: 20,
              direction: Axis.horizontal,
              borderRadius: 10,
              value: _progressController.value,
              valueColor: const AlwaysStoppedAnimation(Colors.pinkAccent),
              borderColor: Colors.purple,
              backgroundColor: Colors.black26,
              center: Text(
                _completedTasks >= 22
                    ? " اللهم بارك  "
                    : "${(_completedTasks * (100.toDouble() / 22.toDouble())).round()}%",
                style: TextStyle(
                    color: _completedTasks >= 22 ? Colors.white : Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    shadows: const [
                      Shadow(
                          color: Colors.purple,
                          offset: Offset(1, 1),
                          blurRadius: 3)
                    ]),
              ),
            ),
          ),

          // The confetti widget
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
          ),

          // The button to complete a task
          ElevatedButton(
            onPressed: updateProgress,
            child: const Text('Complete Task'),
          ),
        ],
      ),
    );
  }
}
