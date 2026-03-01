import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[200], // Halka background taake card wazeh nazar aaye
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Profile Card",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 320,
          height: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(197, 209, 161, 218),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Profile Icon (Avatar ki jagah)
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.purpleAccent,
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
                //child: Icon(Icons.person, size: 50, color: Colors.white),
              ),

              const SizedBox(height: 20),

              // 2. Name and Title
              const Text(
                "Ramzan",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Flutter Developer",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              // 3. Social Stats (Using Row)
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatColumn("Posts", "30"),
                    _buildStatColumn("Followers", "1.2k"),
                    _buildStatColumn("Following", "150"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // helper function
  Column _buildStatColumn(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(label, style: const TextStyle(color: Colors.purple, fontSize: 12)),
      ],
    );
  }
}
