import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  // 1. Variable define kiya
  final String userName; 

  // 2. Sahi Constructor (Class name ke mutabiq aur required ke sath)
  const Screen2({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen B")),
      body: Center(
        child: Text(
          "Welcome, $userName!", 
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}