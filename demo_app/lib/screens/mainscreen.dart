import 'package:flutter/material.dart';
import 'package:demo_app/screens/product_screen.dart';
import 'package:demo_app/screens/screen1.dart';
import 'package:demo_app/screens/weather_screen.dart';
import 'package:demo_app/screens/login.dart';
import 'package:demo_app/screens/login1.dart';
import 'package:demo_app/screens/profile_card.dart';
import 'package:demo_app/screens/signup1.dart';
import 'package:demo_app/screens/signup.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        backgroundColor: isDark ? Colors.grey[900] : Colors.blue.shade200,
        appBar: AppBar(
          title: const Text(
            "Screen Navigation",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: isDark ? Colors.black : Colors.blue,
          actions: [
            IconButton(
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              onPressed: toggleTheme,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              children: [
                _navButton(context, "Simple Sign Up", const Signup()),
                _navButton(context, "Simple Login", const Login()),
                _navButton(context, "Modern Login", Login1()),
                _navButton(context, "Modern Sign Up",  Signup1()),
                _navButton(context, "Profile Card", const ProfileCard()),
                _navButton(context, "Data Validation & Send", Screen1()),
                _navButton(context, "Product Screen", ProductScreen()),
                _navButton(context, "Weather Screen", WeatherScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isDark ? Colors.grey[800] : Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
          ),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}