// import 'package:flutter/material.dart';

// class UserProfilePage extends StatelessWidget {
//   const UserProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor:const Color.fromARGB(255, 8, 111, 11),
//           shadowColor: const Color.fromARGB(255, 40, 52, 58),
//           elevation: 10,
//             actions: const [
//             Padding(
//               padding: EdgeInsets.only(right: 60.0),
//               child: Row(
//                 children: [
//                    Text(
//                     'Profile',
//                     style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'Anta', fontSize: 35, color: Color.fromARGB(255, 122, 255, 89),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//           ),
//           backgroundColor: Colors.transparent,
//           body: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 8, 111, 11), // Left side color
//                   Color.fromARGB(255, 114, 113, 113),// Right side color
//                 ],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//             ),
//             child: Center(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20,),
//                   IconButton(
//                     onPressed: () {
//                                 // Add profile button functionality here
//                       },
//                       icon: const Icon(Icons.account_circle),
//                               // color: const Color.fromRGBO(0, 0, 0, 1),
//                       color: const Color.fromARGB(255, 232, 226, 226),
//                       iconSize: 150,
//                   ),
//                   // const SizedBox(height: 0,),
//                   IconButton(
//                     onPressed: () {

//                       },
//                       icon: const Icon(Icons.camera_alt),
//                       color: Colors.black,
//                       iconSize: 50,
//                   ),
//                 ],
//               ),
//             ),
//       ),
//       ),
//     );
//   }
// }


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  UserProfilePageState createState() => UserProfilePageState();
}

class UserProfilePageState extends State<UserProfilePage> {
  ImagePicker picker = ImagePicker();
  Image? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _selectedImage = Image.file(
          File(pickedFile.path),
          fit: BoxFit.cover,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    'Profile',
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 232, 226, 226),
                    radius: 75,
                    child: _selectedImage != null
                        ? ClipOval(child: _selectedImage)
                        : const Icon(Icons.account_circle, size: 150),
                  ),
                ),
                const SizedBox(height: 20),
                IconButton(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.camera_alt),
                  color: Colors.black,
                  iconSize: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor:const Color.fromARGB(255, 8, 111, 11),
//           shadowColor: const Color.fromARGB(255, 40, 52, 58),
//           elevation: 10,
//             actions: const [
//             Padding(
//               padding: EdgeInsets.only(right: 60.0),
//               child: Row(
//                 children: [
//                    Text(
//                     'Profile',
//                     style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'Anta', fontSize: 35, color: Color.fromARGB(255, 122, 255, 89),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//           ),
//           backgroundColor: Colors.transparent,
//           body: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 8, 111, 11), // Left side color
//                   Color.fromARGB(255, 114, 113, 113),// Right side color
//                 ],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
//               child: ListView(
//                 children: <Widget> [
//                   imageProfile(),
//                 ],
//               ),
//             ),
//       ),
//       ),
//     );
//   }
// }

// Widget imageProfile(){
//   return const Stack(
//     children: <Widget>[
//       CircleAvatar(
//         radius: 80.0,
//         backgroundImage: AssetImage("assets/rice.jpg"),
//       ),
//       Positioned(
//         bottom: 20.0,
//         right: 20.0,
//         child: InkWell(
//           onTap: () {
//             showModalBottomSheet(
//               context: context,
//                builder: ((builder) => bottomsheet()),
//                );
//           },
//           child: Icon(
//             Icons.camera_alt,
//             color: Colors.teal,
//             size: 28,
//           ),
//         ),
//         ),
//       ],);
// }

// Widget bottomsheet(){
//   return Container(
//     height: 100,
//     width: MediaQuery.of(context).size.width,
//     margin: const EdgeInsets.symmetric(
//       horizontal: 20,
//       vertical: 20,
//     ),
//     child: Column(
//       children: <Widget>[
//         const Text(
//           "Choose Profile Photo",
//           style: TextStyle(
//             fontSize: 20,
//             fontFamily: 'Anta',
//           ),
//         ),
//         const SizedBox(height: 20,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             IconButton(
//               onPressed: (){
//               },
//               icon: const Icon(Icons.camera),
//               ),
//             IconButton(
//               onPressed: (){
//               },
//               icon: const Icon(Icons.image),
//               ),
//           ],
//         )
//       ],
//     ),
//   );
// }