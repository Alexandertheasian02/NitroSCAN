import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:nitroscan_app/setting_page.dart';

class CameraGuestPage extends StatelessWidget {
  final String username;
  const CameraGuestPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 8, 111, 11),
          shadowColor: const Color.fromARGB(255, 40, 52, 58),
          elevation: 10,
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingPage(username:username,)),
                );
              },
              icon: const Icon(Icons.settings),
            ),
            IconButton(
              color: Colors.white,
              onPressed: () {
                // Add your profile view button functionality here
              },
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
        body: Column(
          children: [
            const Expanded(
              child: CameraScreen(),
            ),
            Container(
              width: double.infinity,
              height: 92,
              color: const Color.fromARGB(255, 8, 111, 11),
            ),
            Container(
              width: double.infinity,
              height: 65.454,
              color: const Color.fromARGB(255, 11, 159, 16),
            ),
          ],
        ),
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController cameraController;
  late List<CameraDescription> cameras;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      cameraController = CameraController(
        cameras[0],
        ResolutionPreset.high,
        enableAudio: false,
      );

      await cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {
          isCameraInitialized = true;
        });
      }).catchError((error) {
      });
    } else {
    }
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isCameraInitialized
        ? Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: CameraPreview(cameraController),
                ),
              ],
            ),
          )
        : Center(
            child: Image.asset(
              "assets/image 5.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          );
  }
}








           // Container(
            //   width: double.infinity,
            //   height: 92,
            //   color: const Color.fromARGB(255, 8, 111, 11),
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 65.454,
            //   color: const Color.fromARGB(255, 11, 159, 16),
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 15,bottom: 15,left: 140,right: 20),
            //     child: Row(
            //       children: [
            //         Container(
            //           height: 40,
            //           width: 100,
            //           decoration: BoxDecoration(
            //             color: const Color.fromARGB(255, 122, 255, 89),
            //             borderRadius: BorderRadius.circular(25),                   
            //           ),
            //           child: const Center(
            //             child: Text("Photo",
            //               style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
            //             ),
            //           ),
            //         ),
            //         const SizedBox(width: 30,),
                    // GestureDetector( // Changed from Container to GestureDetector
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) =>const ResultPage()), // Navigate to ResultPage
                    //     );
                    //   },
                    //   child: Container(
                    //     height: 40,
                    //     width: 100,
                    //     decoration: BoxDecoration(
                    //       color: const Color.fromARGB(255, 122, 255, 89),
                    //       borderRadius: BorderRadius.circular(25),                   
                    //     ),
                    //     child: const Center(
                    //       child: Text("Upload",
                    //         style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.w800, color: Colors.black,),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  // ],
                // ),
              // ),
            // ),




            // bottomNavigationBar: Container(
        //       decoration: BoxDecoration(
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.black.withOpacity(0.3), // Change color and opacity as needed
        //             spreadRadius: 2,
        //             blurRadius: 5,
        //             offset:const Offset(0, -3), // Adjust the offset to control the shadow's position
        //           ),
        //         ],
        //       ),
        //       child: BottomAppBar(
        //         color: const Color.fromARGB(255, 8, 111, 11),
        //         child: Center(
        //           child: ElevatedButton(
        //                 onPressed: () {
        //                   Navigator.push(
        //                     context,
        //                     MaterialPageRoute(builder: (context) => const ResultPage(imagePath: '',)),
        //                   );
        //                 },
        //                 style: ElevatedButton.styleFrom(
        //                   backgroundColor: const Color.fromARGB(255, 18, 196, 24),
        //                   shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(35),
        //                   ),
        //                   minimumSize: const Size(170, 50), 
        //                 ),
        //                 child: const Text(
        //                   "Upload",
        //                   style: TextStyle(
        //                     fontSize: 18,
        //                     fontFamily: 'Anta',
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.black,
        //                   ),
        //                 ),
        //               ),
        //         ),
        //       ),
        // ),