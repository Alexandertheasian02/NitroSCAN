import 'package:flutter/material.dart';
import 'package:nitroscan_app/signin.dart';
import 'package:nitroscan_app/signup.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent, // Set the background color
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 8, 111, 11), // Left side color
                Color.fromARGB(255, 114, 113, 113),// Right side color
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 80), // Add vertical spacing
                const CircleAvatar(
                  radius: 70, // Adjust the radius as needed
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    "assets/Ellipsenew.jpg", // Replace 'your_project_logo.png' with your image file path
                  ),
                ),
                const SizedBox(height: 70),
                const Text(
                  "NitroSCAN", // Text to display
                  style: TextStyle(
                    color: Color.fromARGB(255, 122, 255, 89), // Text color
                    fontSize: 36,
                    fontFamily: "Anta", // Font size (increased from previous pages)
                    fontWeight: FontWeight.w900, // Font weight
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to sign-in page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Signin()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 18, 196, 24)), // Set background color to black
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
                        ),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontFamily: "Anta",
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to sign-up page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Signup()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 18, 196, 24)), // Set background color to black
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color to white
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontFamily: "Anta",
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
