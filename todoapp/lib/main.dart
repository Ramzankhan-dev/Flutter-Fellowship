import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Provider package
import 'package:todoapp/viewmodals/task_provider.dart';
import 'views/home/home_screen.dart';        // Home screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // 🎁 Provider create karo
      create: (context) => TaskProvider(),  // TaskProvider ka ek instance banao
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),  // Home screen dikhao
        debugShowCheckedModeBanner: false, //top right side banner debug wla
      ),
    );
  }
}