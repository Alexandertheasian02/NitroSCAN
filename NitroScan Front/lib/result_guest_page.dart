import 'package:flutter/material.dart';
import 'package:nitroscan_app/home_page.dart';

class ResultGuestPage extends StatelessWidget {
  const ResultGuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color.fromARGB(255, 8, 111, 11),
          shadowColor: const Color.fromARGB(255, 40, 52, 58),
          automaticallyImplyLeading: false,
          elevation: 10,
            title: Row(
            children: [
              const SizedBox(width: 20,),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Container(
                  height: 30,
                  width: 170,
                  decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 3, 179, 9),
                          borderRadius: BorderRadius.circular(25), 
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12, right: 12,),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_rounded),
                        SizedBox(width: 5),
                        Text(
                          'Back to Menu',
                          style: TextStyle(fontWeight: FontWeight.w900, fontFamily: 'Anta', fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 50,),
              const Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text(
                  'Result',
                  style: TextStyle(fontWeight: FontWeight.w900, fontFamily: 'Anta', fontSize: 30, color: Color.fromARGB(255, 122, 255, 89)),
                ),
              ),
            ],
          ),
          ),
          backgroundColor:Colors.transparent,
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
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                    child: Container(
                      height:120,
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
                                  style: TextStyle(fontSize: 18, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
                                ),
                                const SizedBox(width: 69),
                                const Text(" - ",
                                style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
                                ),
                                const SizedBox(width: 10),
                                Image.asset(
                                  "assets/image 5.jpg",
                                  height: 100,
                                  width: 120,),
                              ],
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 20),
                    child: Container(
                      height:60,
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
                                SizedBox(width: 15.2),
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
                  const SizedBox(height:20),
                  Expanded(
                    child: Image.asset(
                      "assets/sign.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}