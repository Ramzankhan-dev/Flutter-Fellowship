
// import 'package:demo_app/screens/Signup1.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// class Login1 extends StatelessWidget {
//   final VoidCallback toggleTheme;

//   const Login1({super.key, required this.toggleTheme});

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: isDark ? Colors.blue : Colors.black,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(
//               isDark ? Icons.light_mode : Icons.dark_mode,
//               color: Colors.white,
//             ),
//             onPressed: toggleTheme,
//           ),
//         ],
//       ),
//       backgroundColor: isDark ? Colors.blue : Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 200,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: isDark ? Colors.grey[900] : Colors.blue,
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(100),
//                   bottomRight: Radius.circular(100),
//                 ),
//               ),
//               child: const Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Good to see you!",
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       "lets continue the journey",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white70,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 children: [
//                   Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Username',
//                           hintText: 'Enter your username',
//                           border: InputBorder.none,
//                           icon: Icon(Icons.person),
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 16),

//                   Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           hintText: 'Enter your password',
//                           border: InputBorder.none,
//                           icon: Icon(Icons.lock),
//                         ),
//                         obscureText: true,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 24),

//                   SizedBox(
//                     width: double.infinity,
//                     height: 55,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor:
//                             isDark ? Colors.grey[800] : Colors.blue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                       child: const Text(
//                         "Log In",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   Row(
//                     children: [
//                       Expanded(child: Divider()),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: Text(
//                           "OR",
//                           style: TextStyle(
//                             color: isDark
//                                 ? Colors.grey[400]
//                                 : Colors.grey.shade600,
//                           ),
//                         ),
//                       ),
//                       Expanded(child: Divider()),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _socialButton(
//                           icon: FontAwesomeIcons.google, color: Colors.red),
//                       const SizedBox(width: 20),
//                       _socialButton(
//                           icon: FontAwesomeIcons.facebook,
//                           color: Colors.blue),
//                       const SizedBox(width: 20),
//                       _socialButton(
//                           icon: FontAwesomeIcons.twitter,
//                           color: Colors.lightBlue),
//                     ],
//                   ),

//                   const SizedBox(height: 40),

//                   Column(
//                     children: [
//                       const Text(
//                         "Don't have account?",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>  Signup1(toggleTheme: toggleTheme)),
//                           );
//                         },
//                         child: const Text(
//                           "Sign Up",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _socialButton({required IconData icon, required Color color}) {
//     return Container(
//       width: 60,
//       height: 60,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: color.withOpacity(0.3)),
//       ),
//       child: Center(
//         child: FaIcon(icon, color: color, size: 25),
//       ),
//     );
//   }
// }

import 'package:demo_app/screens/Signup1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login1 extends StatelessWidget {
  const Login1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Good to see you!",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "lets continue the journey",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter your username',
                          border: InputBorder.none,
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: InputBorder.none,
                          icon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "OR",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(icon: FontAwesomeIcons.google, color: Colors.red),
                      const SizedBox(width: 20),
                      _socialButton(icon: FontAwesomeIcons.facebook, color: Colors.blue),
                      const SizedBox(width: 20),
                      _socialButton(icon: FontAwesomeIcons.twitter, color: Colors.lightBlue),
                    ],
                  ),

                  const SizedBox(height: 40),

                  Column(
                    children: [
                      const Text(
                        "Don't have account?",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Signup1()),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _socialButton({required IconData icon, required Color color}) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Center(
        child: FaIcon(icon, color: color, size: 25),
      ),
    );
  }
}