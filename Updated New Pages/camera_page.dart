import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:nitroscan_app/profile_page.dart';
import 'package:nitroscan_app/result_page.dart';
import 'package:nitroscan_app/setting_page.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 8, 111, 11),
          shadowColor: const Color.fromARGB(255, 40, 52, 58),
          elevation: 10,
          title: const Text(
              "Camera", 
              style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'Anta', fontSize: 35.0, color: Color.fromARGB(255, 122, 255, 89)),
            ),
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
        body: const Column(
          children: [
            Expanded(
              child: CameraScreen(),
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
  XFile? capturedImage;

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

  void captureImage() async {
  try {
    final XFile image = await cameraController.takePicture();
    setState(() {
      capturedImage = image;
    });
    } catch (e) {
    // ignore: avoid_print
    print('Error capturing image: $e');
  }
}

  void switchCamera() async {
    if (cameras.length < 2) {
      return;
    }
    CameraDescription newCameraDescription =
        cameraController.description == cameras[0] ? cameras[1] : cameras[0];
    await cameraController.dispose();
    cameraController = CameraController(
      newCameraDescription,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    }).catchError((error) {
    });
  }

  void clearImage() {
    setState(() {
      capturedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isCameraInitialized
        ? Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: capturedImage != null
                      ? Image.file(
                          File(capturedImage!.path),
                          fit: BoxFit.cover,
                        )
                      : CameraPreview(cameraController),
                ),
                if (capturedImage == null)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: captureImage,
                                icon: const Icon(Icons.camera_alt_rounded),
                                color: Colors.white,
                                iconSize: 40,
                              ),
                              const Text("Capture Image",
                              style: TextStyle(fontSize: 14,fontFamily: 'Anta', color: Colors.white,fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: switchCamera,
                                icon: const Icon(Icons.switch_camera_rounded),
                                color: Colors.white,
                                iconSize: 40,
                              ),
                              const Text("Switch Camera",
                              style: TextStyle(fontSize: 14,fontFamily: 'Anta', color: Colors.white,fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (capturedImage != null)
                  Positioned(
                    top: 20,
                    right: 20,
                    child: IconButton(
                      onPressed: clearImage,
                      icon:const Icon(Icons.close),
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Change color and opacity as needed
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset:const Offset(0, -3), // Adjust the offset to control the shadow's position
                  ),
                ],
              ),
              child: BottomAppBar(
                color: const Color.fromARGB(255, 8, 111, 11),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResultPage(capturedImage: capturedImage)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 18, 196, 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      minimumSize: const Size(170, 40), 
                    ),
                    child: const Text(
                      "Upload",
                      style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Anta',
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
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