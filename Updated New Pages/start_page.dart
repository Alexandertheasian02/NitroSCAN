import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nitroscan_app/first.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          ClipOval(
            child: Image.asset('assets/Ellipsenew.jpg'),
            ),
          const SizedBox(height: 10,),
          const Text(
              "  NitroScan  ", 
              style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'Anta', fontSize: 40.0, color: Color.fromARGB(255, 122, 255, 89)),
            ),
        ],
      ), 
      backgroundColor: const Color.fromARGB(255, 66, 156, 69),
      nextScreen: const First(),
      splashIconSize: 280,
      duration: 2000,
      splashTransition: SplashTransition.scaleTransition,

      );
  }
}