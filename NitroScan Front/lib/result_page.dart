import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nitroscan_app/profile_page.dart';
import 'package:nitroscan_app/setting_page.dart';

class ResultPage extends StatelessWidget {
  // const ResultPage({super.key});

  final String imagePath;

  const  ResultPage({super.key, required this.imagePath}); // Define the imagePath parameter here


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color.fromARGB(255, 8, 111, 11),
          shadowColor: const Color.fromARGB(255, 40, 52, 58),
          elevation: 10,
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingPage()),
                );
              },
              icon: const Icon(Icons.settings),
            ),
            IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> const ProfilePage()),
                    );
              },
              icon: const Icon(Icons.account_circle),
            ),
          ],
          ),
          backgroundColor: Colors.transparent,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 13),
                    child: Container(
                      height:100,
                      width:350,
                      decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),  
                              gradient:const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 3, 179, 9),
                                  Color.fromARGB(255, 176, 175, 175),
                                ],
                              ),                 
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 40),
                                const Text("Image",
                                  style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
                                ),
                                const SizedBox(width: 109),
                                const Text(" - ",
                                style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
                                ),
                                const SizedBox(width: 10),
                                // Image.asset(
                                //   "assets/image 5.jpg",
                                //   height: 60,
                                //   width: 90,),
                                Image.file(
                                  File(imagePath),
                                  height: 90,
                                  width: 100,
                                  ),
                              ],
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 13),
                    child: Container(
                      height:50,
                      width:350,
                      decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient:const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 3, 179, 9),
                                  Color.fromARGB(255, 176, 175, 175), // Lower Medium Brown
                                ],
                              ),                                    
                            ),
                            child: const Row(
                              children: [
                                SizedBox(width: 40),
                                Text("LCC Number",
                                  style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
                                ),
                                SizedBox(width: 55.2),
                                Text(" - ",
                                style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
                                ),
                                SizedBox(width: 20),
                                Text(" 3 ",
                                style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
                                ),
                              ],
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 13),
                    child: Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient:const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 3, 179, 9),
                                  Color.fromARGB(255, 176, 175, 175), // Lower Medium Brown
                                ],
                              ),                 
                      ),
                      child: Row(
                        children: [ 
                          const SizedBox(width: 40,),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Required Amount\n', // '\n' will add a line break
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Anta',
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'of Nitrogen',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Anta',
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text(" - ",
                            style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
                              ),
                          const SizedBox(width: 10,),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '7.5 kg per 1\n', // '\n' will add a line break
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Anta',
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'acre',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Anta',
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 13),
                    child: Container(
                      height:50,
                      width:350,
                      decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient:const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 3, 179, 9),
                                  Color.fromARGB(255, 176, 175, 175), // Lower Medium Brown
                                ],
                              ),                                    
                            ),
                            child: const Row(
                              children: [
                                SizedBox(width: 40),
                                Text("Suggestions",
                                  style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
                                ),
                                SizedBox(width: 52),
                                Text(" - ",
                                style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
                                ),
                                SizedBox(width: 20),
                                Text(" Urea ",
                                style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
                                ),
                              ],
                            ),
                    ),
                  ),
                  const SizedBox(height:10),
                  Expanded(
                    child: Image.asset(
                      "assets/notguest.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ],
              )
            ),
          ),
      ),
    );
  }
}