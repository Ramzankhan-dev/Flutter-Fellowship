import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Widgetpractice extends StatelessWidget {
  const Widgetpractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 153, 155, 43),
        title: Text(
          "Widgets Practice",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 320,
            height: 650,

            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(197, 199, 231, 19),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Muhammad Ramzan",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: 100,
                  height: 10,
                  child: Container(color: Colors.blue),
                ),
                const SizedBox(height: 20),
                // Image.network(
                //   "https://picsum.photos/200",
                //   width: 150,
                //   height: 150,
                //   fit: BoxFit.cover,
                // ),
                // const SizedBox(height: 20),
                // Icon(Icons.favorite, color: Colors.red, size: 30),
                // const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color.fromARGB(255, 94, 157, 209),
                //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                //   ),
                //   child: Text("Login", style: TextStyle(color: Colors.white)),
                // ),
                Stack(
                  children: [
                    Image.network("https://picsum.photos/200"),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Icon(Icons.favorite, color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: Container(color: Colors.red, height: 50)),
                    Expanded(child: Container(color: Colors.blue, height: 50)),
                    Expanded(child: Container(color: Colors.red, height: 50)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(color: Colors.green, height: 50),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(color: Colors.orange, height: 50),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email Enter Karein", // Oper chota sa label
                    hintText: "example@gmail.com", // Box ke andar halka sa text
                    prefixIcon: Icon(Icons.email), // Shuru mein icon
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // Box ke kinare gol karne ke liye
                    ),
                  ),
                  keyboardType:
                      TextInputType.emailAddress, // Keyboard email wala khulega
                  obscureText:
                      false, // Agar password ho to true kar dein (text chhup jayega)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
