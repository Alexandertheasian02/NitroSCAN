import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nitroscan_app/home_page.dart';
import 'signin.dart'; // Import the sign-in page file
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({Key? key});

  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<Signup> {
  bool _isObscured = true; // Track whether the password is obscured or not
  late TextEditingController _emailController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  Future<bool> signupUser(String username, String email, String password) async {
    const apiUrl = 'http://10.0.2.2:8000/auth/signup/';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'email': email, 'password': password}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error during signup: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 8, 111, 11), // Left side color
                  Color.fromARGB(255, 114, 113, 113), // Right side color
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30), // Add vertical spacing
                    ClipOval(
                      child: Image.asset(
                        "assets/Ellipsenew.jpg", // Replace 'your_project_logo.png' with your image file path
                        width: 180, // Adjust width as needed
                        height: 180, // Adjust height as needed
                      ),
                    ),
                    const Text(
                      "NitroSCAN", // Text to display
                      style: TextStyle(
                        color: Color.fromARGB(255, 122, 255, 89), // Text color
                        fontSize: 24, // Font size
                        fontWeight: FontWeight.bold,
                        fontFamily: "Anta", // Font weight
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                              bottom: 20), // Add padding to the text field
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  Colors.white.withOpacity(0.7), // Set opacity here
                              hintText: 'Email', // Change hint text to "Email"
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontFamily: "Anta",
                              ), // Adjust hint text color and opacity
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 0,
                              bottom: 20), // Add padding to the text field
                          child: TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  Colors.white.withOpacity(0.7), // Set opacity here
                              hintText: 'Username', // Hint text added here
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontFamily: "Anta",
                              ), // Adjust hint text color and opacity
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 0,
                              bottom: 20), // Add padding to the text field
                          child: TextField(
                            controller: _passwordController,
                            obscureText:
                                _isObscured, // Toggle obscuring based on state
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  Colors.white.withOpacity(0.7), // Set opacity here
                              hintText: 'Password', // Hint text added here
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontFamily: "Anta",
                              ), // Adjust hint text color and opacity
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_isObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed:
                                    togglePasswordVisibility, // Toggle password visibility on press
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(
                              8.0), // Add padding to the text button
                          child: ElevatedButton(
                            // ElevatedButton for sign-up
                            onPressed: () async {
                              String username = _usernameController.text;
                              String email = _emailController.text;
                              String password = _passwordController.text;

                              try {
                                bool success = await signupUser(username, email, password);
                                if (success) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Signin(),
                                    ),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Sign Up Failed'),
                                      content: Text('Failed to sign up. Please try again.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              } catch (e) {
                                print('Error during sign up: $e');
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      const Color.fromARGB(
                                          255, 11, 176, 16)),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.white),
                            ),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontFamily: "Anta",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10, // Add vertical spacing
                        ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Align items to the center
                        children: [
                          const Text(
                            "Already have an account? ", // Change text
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Anta",
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to signin page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signin()),
                              );
                            },
                            child: const Text(
                              'Sign in', // Change text
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Anta",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // const SizedBox(height: 100,)
                ],
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }
}
