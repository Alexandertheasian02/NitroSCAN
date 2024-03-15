import 'package:flutter/material.dart';
import 'package:nitroscannew/pages/history.dart';
import 'signin.dart'; // Import the sign-in page file
import 'signup.dart'; // Import the sign-up page file
import 'history.dart'; // Import the history page file

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 111, 11), // Set the background color
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50), // Add vertical spacing
              CircleAvatar(
                radius: 70, // Adjust the radius as needed
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  "assets/Ellipsenew.jpg", // Replace 'your_project_logo.png' with your image file path
                ),
              ),
              SizedBox(height: 30),
              Text(
                "NitroSCAN", // Text to display
                style: TextStyle(
                  color: Colors.greenAccent, // Text color
                  fontSize: 32,
                  fontFamily: "Anta", // Font size (increased from previous pages)
                  fontWeight: FontWeight.bold, // Font weight
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
                          MaterialPageRoute(builder: (context) => Signin()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent), // Set background color to black
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set text color to white
                      ),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontFamily: "Anta",
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to sign-up page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent), // Set background color to black
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set text color to white
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontFamily: "Anta",
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to history page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HistoryPage()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent), // Set background color to black
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set text color to white
                      ),
                      child: Text(
                        'View History',
                        style: TextStyle(
                          fontFamily: "Anta",
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
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: First(),
  ));
}
