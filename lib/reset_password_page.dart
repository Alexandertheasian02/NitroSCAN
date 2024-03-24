import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nitroscan_app/login_security_page.dart';

class ResetPasswordPage extends StatefulWidget {
  final String username;

  const ResetPasswordPage({Key? key, required this.username}) : super(key: key);

  @override
  ResetPasswordPageState createState() => ResetPasswordPageState();
}

class ResetPasswordPageState extends State<ResetPasswordPage> {
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<bool> resetPassword(String username, String newPassword) async {
    const apiUrl = 'http://10.0.2.2:8000/auth/resetpassword/';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'new_password': newPassword}),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error during password reset: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 8, 111, 11),
          shadowColor: const Color.fromARGB(255, 40, 52, 58),
          elevation: 10,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                children: [
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Anta',
                      fontSize: 30,
                      color: const Color.fromARGB(255, 122, 255, 89),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 100),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: TextFormField(
                          controller: _currentPasswordController,
                          obscureText: !isPasswordVisible,
                          decoration: const InputDecoration(
                            hintText: 'Current Password',
                            hintStyle: TextStyle(fontFamily: 'Anta', fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.all(16.0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: TextFormField(
                          controller: _newPasswordController,
                          obscureText: !isPasswordVisible,
                          decoration: const InputDecoration(
                            hintText: 'New Password',
                            hintStyle: TextStyle(fontFamily: 'Anta', fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.all(16.0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: !isPasswordVisible,
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(fontFamily: 'Anta', fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.all(16.0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () async {
                      String currentPassword = _currentPasswordController.text;
                      String newPassword = _newPasswordController.text;
                      String confirmPassword = _confirmPasswordController.text;

                      if (newPassword == confirmPassword) {
                        try {
                          bool success = await resetPassword(widget.username, newPassword);
                          if (success) {
                            // Navigate to the next page upon successful password reset
                            Navigator.pop(
                              context,
                              MaterialPageRoute(builder: (context) => LoginSecurityPage(username: widget.username)),
                            );
                          } else {
                            // Handle unsuccessful password reset
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Password Reset Failed'),
                                content: Text('Failed to reset password. Please try again.'),
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
                          print('Error during password reset: $e');
                        }
                      } else {
                        // Display an error dialog if passwords don't match
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Passwords Do Not Match'),
                            content: Text('The entered passwords do not match. Please try again.'),
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
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 18, 196, 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      minimumSize: const Size(220, 50),
                    ),
                      child: const Text(
                        "Set New Password",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Anta',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 249,)
                  ],
                  ),
              ),
            ),
          ),
      ),
    );
  }
}