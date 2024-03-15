import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'signin.dart'; // Import the sign-in page file

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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

  static void singUserUp() {
    // Implement your sign-up logic here
    print('Sign up button tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 8, 111, 11), // Set the background color
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Set background color to transparent
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50), // Add vertical spacing
              ClipOval(
                child: Image.asset(
                  "assets/Ellipsenew.jpg", // Replace 'your_project_logo.png' with your image file path
                  width: 100, // Adjust width as needed
                  height: 100, // Adjust height as needed
                ),
              ),
              const Text(
                "NitroSCAN", // Text to display
                style: TextStyle(
                  color: Colors.greenAccent, // Text color
                  fontSize: 24, // Font size
                  fontWeight: FontWeight.bold,
                  fontFamily: "Anta", // Font weight
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Add padding to the text field
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
                      padding: const EdgeInsets.all(
                          8.0), // Add padding to the text field
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
                      padding: const EdgeInsets.all(
                          8.0), // Add padding to the text field
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
                        onPressed: singUserUp,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 11, 176, 16)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Signup(),
  ));
}
