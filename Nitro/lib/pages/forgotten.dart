import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 111, 11),
<<<<<<< HEAD
        shadowColor: const Color.fromARGB(255, 40, 52, 58),
        elevation: 10,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Row(
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Anta',
                    fontSize: 30,
                    color: Color.fromARGB(255, 122, 255, 89),
                  ),
                ),
              ],
            ),
          ),
        ],
=======
        title: const Text('Forgot Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
>>>>>>> 95464ab828d58b6292a912f47af131a84f4bcd37
      ),
      backgroundColor: const Color.fromARGB(255, 8, 111, 11),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Forgotten password?',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Anta",
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Not to worry, we'll assist you in changing your password by sending you a message.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: "Anta",
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your email to reset password',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: "Anta",
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                    fontFamily: "Anta",
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Continue button tapped');
                // For demonstration, let's navigate to the OTP page directly
                navigateToOtpPage(context, "user@example.com");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 11, 176, 16)),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Anta",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpPage extends StatelessWidget {
  final String email;

  const OtpPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        backgroundColor: const Color.fromARGB(255, 8, 111, 11),
        shadowColor: const Color.fromARGB(255, 40, 52, 58),
        elevation: 10,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Row(
              children: [
                Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Anta',
                    fontSize: 30,
                    color: Color.fromARGB(255, 122, 255, 89),
                  ),
                ),
              ],
            ),
          ),
        ],
=======
        title: const Text('Verify OTP'),
        backgroundColor: const Color.fromARGB(255, 8, 111, 11),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
>>>>>>> 95464ab828d58b6292a912f47af131a84f4bcd37
      ),
      backgroundColor: const Color.fromARGB(255, 8, 111, 11),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the OTP sent to $email',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Anta',
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  hintStyle: TextStyle(
                    fontFamily: 'Anta',
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Verify OTP button tapped');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 11, 176, 16)),
              ),
              child: const Text(
                'Verify OTP',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Anta',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void navigateToOtpPage(BuildContext context, String email) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => OtpPage(email: email)),
  );
}

void main() {
  runApp(const MaterialApp(
    home: ForgotPasswordPage(),
  ));
}
