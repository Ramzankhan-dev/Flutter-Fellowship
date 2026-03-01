import 'package:demo_app/screens/product_screen.dart';
import 'package:demo_app/screens/screen1.dart';
import 'package:demo_app/screens/weather_screen.dart';
import 'package:flutter/material.dart';
// Apne saare imports yahan rakhein
import 'package:demo_app/screens/login.dart';
import 'package:demo_app/screens/login1.dart';
import 'package:demo_app/screens/profile_card.dart';
import 'package:demo_app/screens/signup1.dart';
import 'package:demo_app/screens/signup.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: const Text(
          "Screen Navigation",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView( // Agar buttons zyada hon to scroll ho sakein
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              // Custom Helper Method use kar rahe hain
              _navButton(context, "Simple Sign Up", const Signup()),
              _navButton(context, "Simple Login", const Login()),
              _navButton(context, "Modern Login", const Login1()),
              _navButton(context, "Modern Sign Up", const Signup1()),
              _navButton(context, "Profile Card", const ProfileCard()),
              _navButton(context, "data validation & send", Screen1()),
              _navButton(context, "Product screen", ProductScreen()),
              _navButton(context, "Weather screen", WeatherScreen()),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget: Is se code saaf rehta hai aur styling ek hi jagah se change hoti hai
  Widget _navButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15), // Buttons ke darmiyan gap
      child: SizedBox(
        width: double.infinity, // Buttons ki width barabar karne ke liye
        height: 55,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
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