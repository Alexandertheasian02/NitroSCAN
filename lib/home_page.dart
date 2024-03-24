import 'package:flutter/material.dart';
import 'package:nitroscan_app/camera_page.dart';
import 'package:nitroscan_app/profile_page.dart';
import 'package:nitroscan_app/setting_page.dart';
// import 'package:nitroscan_app/user_profile_page.dart';

class HomePage extends StatefulWidget {
  final String username; // Define username variable
  const HomePage({Key? key, required this.username}) : super(key: key); 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // Modify constructor
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:const Color.fromARGB(255, 8, 111, 11),
            shadowColor: const Color.fromARGB(255, 40, 52, 58),
            elevation: 10,
            title: const Text(
              "  NitroScan  ", 
              style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'Anta', fontSize: 35.0, color: Color.fromARGB(255, 122, 255, 89)),
            ),
            actions: [
              IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SettingPage(username: widget.username)),
                  );
                },
                icon: const Icon(Icons.settings),
              ),
              IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> ProfilePage(username: widget.username,)),
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      _createColoredContainer(
                        const Color.fromARGB(255, 176, 175, 175),
                        const Color.fromARGB(255, 3, 179, 9),
                        "Leaf Color Chart",
                        "assets/Screenshot 2024-01-28 at 19.48 1.jpg",),
                      const SizedBox(width: 12,),
                      _createColoredContainer(
                        const Color.fromARGB(255, 176, 175, 175),
                        const Color.fromARGB(255, 3, 179, 9),
                        "Paddy Cultivation Stages",
                        "assets/image 2.jpg",),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height:15),
                Expanded(child: Stack(
                  children: [
                    Image.asset(
                      "assets/rice.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: 100,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: [
                               Color.fromARGB(255, 36, 149, 8), 
                               Color.fromARGB(255, 42, 43, 42),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.9),
                              spreadRadius: 15,
                              blurRadius: 20,
                              offset: const Offset(10, 12),
                            ),
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Camera",
                                style: TextStyle(fontSize: 20,fontFamily: 'Anta', color: Colors.black,fontWeight: FontWeight.w800),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  CameraPage(username: widget.username,)),
                                  );
                                },
                                icon: const Icon(Icons.camera_alt),
                                color: Colors.black,
                                iconSize: 35,
                              ),
                            ],
                          ),
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


Widget _createColoredContainer(
  Color upperColor,
  Color lowerColor,
  String title,
  String assetPath,){
  return Container(
      width: 170,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        gradient: LinearGradient(
          colors: [upperColor, lowerColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.4, 1.0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Anta',
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              assetPath,             
            ),
          ],
        ),
      ),
  );
}