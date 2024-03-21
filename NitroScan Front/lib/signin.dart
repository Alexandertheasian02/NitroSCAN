import 'package:flutter/material.dart';
import 'package:nitroscan_app/home_page.dart';
// import 'forgotten.dart'; // Import the forgot password page file
// import 'signup.dart'; // Import the sign-up page file

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  SigninState createState() => SigninState();
}

class SigninState extends State<Signin> {
  bool _isObscured = true; // Track whether the password is obscured or not
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void forgotPassword() {
    // Navigate to forgot password page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void navigateToSignUp() {
    // Navigate to the sign-up page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
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
                    Color.fromARGB(255, 114, 113, 113),// Right side color
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50), // Add vertical spacing
                  ClipOval(
                    child: Image.asset(
                      "assets/Ellipse 1.jpg",
                      width: MediaQuery.of(context).size.width *
                          0.5, // Adjust image width
                      height: MediaQuery.of(context).size.width *
                          0.5, // Adjust image height
                    ),
                  ),
                  const Text(
                    "NitroSCAN",
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 24,
                      fontFamily: "Anta",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20), // Add vertical spacing
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7), // opacity
                        hintText: 'Email', // Change hint text to "Email"
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.8),
                          fontFamily: "Anta",
                        ), // hint text color and opacity
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
                    padding: const EdgeInsets.all(
                        20.0), // Add padding to the text field
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _isObscured, // Toggle obscuring based on state
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7),
                        hintText: 'Password', // Hint text
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
                    padding: const EdgeInsets.all(8.0), //  padding to text button
                    child: TextButton(
                      onPressed:
                          forgotPassword, // Call forgotPassword function on press
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Anta",
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    // Revert back to ElevatedButton for signin
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(
                              255, 11, 176, 16)), // Set background color to black
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // Set text color to white
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontFamily: "Anta",
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
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Anta",
                        ),
                      ),
                      TextButton(
                        onPressed: navigateToSignUp,
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Anta",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30, // Add vertical spacing
                  ),
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
