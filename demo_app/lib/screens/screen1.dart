import 'package:demo_app/screens/screen2.dart'; // Apni file ka sahi path check kar lein
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Screen1> {
  // 1. Form Key: Ye pooray form ki 'ID' hai validation ke liye
  final _formKey = GlobalKey<FormState>();

  // 2. Controllers: Data nikalne ke liye
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // 3. FocusNode: Keyboard ko control karne ke liye
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login & Share")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey, // Form ko key assign kar di
          child: Column(
            children: [
              // --- EMAIL FIELD ---
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passwordFocus);
                },
                // Validation Logic
                validator: (value) {
                  if (value == null || value.isEmpty) return "Email is required";
                  if (!value.contains("@")) return "Enter valid email";
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // --- PASSWORD FIELD ---
              TextFormField(
                controller: passwordController,
                focusNode: passwordFocus,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                // Validation Logic
                validator: (value) {
                  if (value == null || value.isEmpty) return "Password is required";
                  if (value.length < 6) return "Min 6 characters required";
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // --- LOGIN & SHARE BUTTON ---
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Full width button
                ),
                onPressed: () {
                  // Pehle check karo form valid hai ya nahi
                  if (_formKey.currentState!.validate()) {
                    
                    // Agar valid hai, toh data share karo aur Next Screen par jao
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screen2(userName: emailController.text),
                      ),
                    );
                    
                    print("Login Successful & Data Sent!");
                  }
                },
                child: const Text("Login & Send Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}