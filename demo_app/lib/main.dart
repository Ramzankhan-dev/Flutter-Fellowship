
// import 'package:demo_app/screens/mainscreen.dart';
// import "package:flutter/material.dart";

// void main(){
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return MaterialApp(
//       home: MyWidget(),
//     );
//   }
// }
import 'package:demo_app/screens/mainscreen.dart';
import "package:flutter/material.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart'; // ADD

void main() async { // async ADD karo
  await dotenv.load(fileName: ".env"); // ADD
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}