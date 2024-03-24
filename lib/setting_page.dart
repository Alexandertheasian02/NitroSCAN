import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nitroscan_app/history.dart';
import 'package:nitroscan_app/login_security_page.dart';
import 'package:nitroscan_app/privacy_policy_page.dart';
import 'package:nitroscan_app/profile_page.dart';
import 'package:nitroscan_app/signin.dart';

class SettingPage extends StatefulWidget {
  final String username;
  const SettingPage({Key? key, required this.username}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String selectedLanguage = 'English';

  Future<bool> resetPassword(
      String username, String currentPassword, String newPassword) async {
    const apiUrl = 'http://10.0.2.2:8000/auth/logout/';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username}),
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
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 8, 111, 11),
          shadowColor: const Color.fromARGB(255, 40, 52, 58),
          elevation: 10,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 60.0),
              child: Row(
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Anta',
                      fontSize: 35,
                      color: Color.fromARGB(255, 122, 255, 89),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Container(
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
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontFamily: 'Anta',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                contentPadding: EdgeInsets.all(16.0),
                                hintText: 'Search',
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProfilePage(username: widget.username),
                              ),
                            );
                          },
                          icon: const Icon(Icons.account_circle),
                          color: const Color.fromARGB(255, 232, 226, 226),
                          iconSize: 60,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    // Other Settings Options...
                    // For brevity, I'm skipping them here
                    // Add your existing settings UI here
                    Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginSecurityPage(username: widget.username,)),
                              );
                            },
                            icon: const Icon(Icons.key),
                            color: const Color.fromARGB(255, 232, 226, 226),
                            iconSize: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginSecurityPage(username: widget.username,)),
                              );
                            },
                          child: const Text("Login & Security",
                          style: TextStyle(fontSize: 19,fontFamily: 'Anta', color: Color.fromARGB(255, 232, 226, 226),fontWeight: FontWeight.w600)
                          ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PrivacyPolicyPage(username: widget.username,)),
                              );
                            },
                            icon: const Icon(Icons.lock_rounded),
                            color: const Color.fromARGB(255, 232, 226, 226),
                            iconSize: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PrivacyPolicyPage(username: widget.username,)),
                              );
                            },
                          child: const Text("Privacy",
                          style: TextStyle(fontSize: 19, fontFamily: 'Anta', color: Color.fromARGB(255, 232, 226, 226),fontWeight: FontWeight.w600)
                          ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                            },
                            icon: const Icon(Icons.notifications_rounded),
                            color: const Color.fromARGB(255, 232, 226, 226),
                            iconSize: 30,
                          ),
                          const Text("Notification",
                          style: TextStyle(fontSize: 19,fontFamily: 'Anta', color: Color.fromARGB(255, 232, 226, 226),fontWeight: FontWeight.w600)
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HistoryPage(username: widget.username,)),
                              );
                            },
                            icon: const Icon(Icons.lock_rounded),
                            color: const Color.fromARGB(255, 232, 226, 226),
                            iconSize: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HistoryPage(username: widget.username,)),
                              );
                            },
                          child: const Text("History",
                          style: TextStyle(fontSize: 19, fontFamily: 'Anta', color: Color.fromARGB(255, 232, 226, 226),fontWeight: FontWeight.w600)
                          ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                            },
                            icon: const Icon(Icons.bookmark_sharp),
                            color: const Color.fromARGB(255, 232, 226, 226),
                            iconSize: 30,
                          ),
                          const Text("Favorite",
                          style: TextStyle(fontSize: 19,fontFamily: 'Anta', color: Color.fromARGB(255, 232, 226, 226),fontWeight: FontWeight.w600)
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                            },
                            icon: const Icon(Icons.language_rounded),
                            color: const Color.fromARGB(255, 232, 226, 226),
                            iconSize: 30,
                          ),
                          const Text("Language",
                          style: TextStyle(fontSize: 19, fontFamily: 'Anta',color: Color.fromARGB(255, 232, 226, 226),fontWeight: FontWeight.w600)
                          ),
                          const SizedBox(width: 15),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 11, 176, 16), // Set the background color to white
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DropdownButton<String>(
                              value: selectedLanguage,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedLanguage = newValue!;
                                });
                              },
                              iconEnabledColor: Colors.lime,
                              dropdownColor: Colors.deepOrangeAccent,
                              iconSize: 40,
                              borderRadius: BorderRadius.circular(20),
                              items: <String>['English', 'Sinhala', 'Tamil']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style:const TextStyle(fontSize: 17, color: Color.fromARGB(255, 232, 226, 226), fontFamily:'Anta',fontWeight: FontWeight.bold),
                                    ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                            },
                            icon: const Icon(Icons.help_outline_rounded),
                            color: const Color.fromARGB(255, 232, 226, 226),
                            iconSize: 30,
                          ),
                          const Text("Help",
                          style: TextStyle(fontSize: 19,fontFamily: 'Anta', color: Color.fromARGB(255, 232, 226, 226),fontWeight: FontWeight.w600)
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _logout();
                          },
                          icon: const Icon(Icons.logout),
                          color: const Color.fromARGB(255, 232, 226, 226),
                          iconSize: 30,
                        ),
                        const Text("Sign Out",
                            style: TextStyle(
                                fontSize: 19,
                                fontFamily: 'Anta',
                                color: Color.fromARGB(255, 232, 226, 226),
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(
                      height: 67,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to handle logout
  void _logout() {
    // Implement any logout logic here, such as clearing session data
    // For now, let's just navigate to the login page
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Signin()), // Replace LoginPage with your actual login page class
      (Route<dynamic> route) => false, // This line removes all routes from the stack, ensuring user cannot go back to SettingPage
    );
  }
}
