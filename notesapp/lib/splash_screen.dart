import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notesapp/home_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // 3 seconds ke baad next screen
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),

          // Logo
          Icon(Icons.book, size: 100, color: Colors.white),

          SizedBox(height: 20),

          Text(
            "Notes App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),

          Spacer(),

          // 🔥 Loading Line
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: LinearProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.white30,
            ),
          ),
        ],
      ),
    );
  }
}