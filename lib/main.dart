import 'package:flutter/material.dart';
import 'package:nitroscan_app/first.dart';
// import 'package:nitroscan_app/home_page.dart';
// import 'package:nitroscan_app/signin.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NitroScan App",
      home: First(),
    );
  }
}


