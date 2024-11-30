import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "Flashcard Quiz",
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}
