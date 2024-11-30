import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, int> args = ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    final int totalFlashcards = args['totalFlashcards']!;
    final int completedFlashcards = args['completedFlashcards']!;
    double progress = completedFlashcards / totalFlashcards;

    return Scaffold(
      appBar: AppBar(
        title: Text('Progress'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade600, Colors.blueAccent.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Progress',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                // Enhanced Circular Progress Indicator
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 10,
                      backgroundColor: Colors.white30,
                    ),
                    CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 10,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  '${(progress * 100).toStringAsFixed(1)}% Completed',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '$completedFlashcards out of $totalFlashcards Questions Correct.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5, // Added elevation for a raised button effect
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Return to Quiz',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
