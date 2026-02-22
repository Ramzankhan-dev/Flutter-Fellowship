//import "package:demo_app/home_page.dart";
//import 'package:demo_app/profile_card.dart';
//import 'package:demo_app/widgets.dart';
//import 'package:demo_app/login.dart';
import 'package:demo_app/signup1.dart';
//import 'package:demo_app/signup.dart';
import "package:flutter/material.dart";

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      //home : HomePage(),
      //home : ProfileCard(),
      //home : Widgetpractice(),
      //home: Login(),
      // home: Signup(),
      home: Signup1(),
    );
  }
}