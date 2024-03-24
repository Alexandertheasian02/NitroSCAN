import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nitroscan_app/home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  late ImagePicker _imagePicker;
  File? _imageFile;
  TextEditingController nameController = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  TextEditingController nameController3 = TextEditingController();
  TextEditingController nameController4 = TextEditingController();
  TextEditingController nameController5 = TextEditingController();
  String previewText = '';
  bool isEditing = false;
  bool isEditing_2 = false;
  bool isEditing_3 = false;
  bool isEditing_4 = false;
  bool isEditing_5 = false;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    imageProfile(context),
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left:10,right: 10),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: TextField(
                            style: const TextStyle(fontSize: 16,fontFamily: 'Anta',fontWeight: FontWeight.w900,color: Colors.black),
                            controller: nameController,
                            onChanged: (value) {
                              setState(() {
                                
                              });
                            },
                            onTap: () {
                              setState(() {
                                isEditing = true;
                              });
                            },
                            maxLength: 18,
                            decoration: InputDecoration(
                              hintText: isEditing ? '' : 'Name :',
                              hintStyle: const TextStyle(fontFamily: 'Anta',fontWeight: FontWeight.w800,),
                              contentPadding: const EdgeInsets.only(top: 15,bottom: 15,left: 30,right: 20),
                              border: InputBorder.none,
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 30),
                                child: Icon(Icons.edit),
                              ), 
                              suffixIconColor: const Color.fromARGB(255, 67, 67, 67),
                              prefixText: 'Name :  ',
                              prefixStyle: const TextStyle(fontSize: 16,fontFamily: 'Anta',fontWeight: FontWeight.w900,color: Colors.black),
                              counterText: '',
                          ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:10,right: 10),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: TextField(
                            style: const TextStyle(fontSize: 16,fontFamily: 'Anta',fontWeight: FontWeight.w900,color: Colors.black),
                            controller: nameController2,
                            onChanged: (value) {
                              setState(() {
                              
                              });
                            },
                            onTap: () {
                              setState(() {
                                isEditing_2 = true;
                              });
                            },
                            maxLength: 18,
                            decoration: InputDecoration(
                              hintText: isEditing_2 ? '' : 'About :',
                              hintStyle: const TextStyle(fontFamily: 'Anta',fontWeight: FontWeight.w800,),
                              contentPadding: const EdgeInsets.only(top: 15,bottom: 15,left: 30,right: 20),
                              border: InputBorder.none,
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 30),
                                child: Icon(Icons.edit),
                              ), 
                              suffixIconColor: const Color.fromARGB(255, 67, 67, 67),
                              prefixText: 'About :  ',
                              prefixStyle: const TextStyle(fontSize: 16,fontFamily: 'Anta',fontWeight: FontWeight.w900,color: Colors.black),
                              counterText: '',
                          ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:10,right: 10),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: TextField(
                            style: const TextStyle(fontSize: 16,fontFamily: 'Anta',fontWeight: FontWeight.w900,color: Colors.black),
                            controller: nameController3,
                            onChanged: (value) {
                              setState(() {
                              
                              });
                            },
                            onTap: () {
                              setState(() {
                                isEditing_3 = true;
                              });
                            },
                            maxLength: 38,
                            decoration: InputDecoration(
                              hintText: isEditing_3 ? '' : 'Email :',
                              hintStyle: const TextStyle(fontFamily: 'Anta',fontWeight: FontWeight.w800,),
                              contentPadding: const EdgeInsets.only(top: 15,bottom: 15,left: 30,right: 20),
                              border: InputBorder.none,
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 30),
                                child: Icon(Icons.edit),
                              ), 
                              suffixIconColor: const Color.fromARGB(255, 67, 67, 67),
                              prefixText: 'Email :  ',
                              prefixStyle: const TextStyle(fontSize: 16,fontFamily: 'Anta',fontWeight: FontWeight.w900,color: Colors.black),
                              counterText: '',
                          ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:10,right: 10),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: TextField(
                            style: const TextStyle(fontSize: 16,fontFamily: 'Anta',fontWeight: FontWeight.w900,color: Colors.black),
                            controller: nameController4,
                            onChanged: (value) {
                              setState(() {
                                
                              });
                            },
                            onTap: () {
                              setState(() {
                                isEditing_4 = true;
                              });
                            },
                            maxLength: 18,
                            decoration: InputDecoration(
                              hintText: isEditing_4 ? '' : 'Phone Number :',
                              hintStyle: const TextStyle(fontFamily: 'Anta',fontWeight: FontWeight.w800,),
                              contentPadding: const EdgeInsets.only(top: 15,bottom: 15,left: 30,right: 20),
                              border: InputBorder.none,
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 30),
                                child: Icon(Icons.edit),
                              ), 
                              suffixIconColor: const Color.fromARGB(255, 67, 67, 67),
                              prefixText: 'Phone Number :  ',
                              prefixStyle: const TextStyle(fontSize: 16,fontFamily: 'Anta',fontWeight: FontWeight.w900,color: Colors.black),
                              counterText: '',
                          ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:10,right: 10),
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: TextField(
                            style: const TextStyle(fontSize: 16,fontFamily: 'Anta',fontWeight: FontWeight.w900,color: Colors.black),
                            controller: nameController5,
                            onChanged: (value) {
                              setState(() {
                              
                              });
                            },
                            onTap: () {
                              setState(() {
                                isEditing_5 = true;
                              });
                            },
                            maxLength: 18,
                            decoration: InputDecoration(
                              hintText: isEditing_5 ? '' : 'Country :',
                              hintStyle: const TextStyle(fontFamily: 'Anta',fontWeight: FontWeight.w800,),
                              contentPadding: const EdgeInsets.only(top: 15,bottom: 15,left: 30,right: 20),
                              border: InputBorder.none,
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 30),
                                child: Icon(Icons.edit),
                              ), 
                              suffixIconColor: const Color.fromARGB(255, 67, 67, 67),
                              prefixText: 'Country :  ',
                              prefixStyle: const TextStyle(fontSize: 16,fontFamily: 'Anta',fontWeight: FontWeight.w900,color: Colors.black),
                              counterText: '',
                          ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                                MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 18, 196, 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            minimumSize: const Size(200, 50),
                          ),
                          child: const Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Anta',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),                                       
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageProfile(BuildContext context) {
    return Stack(
      children:[
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.5,
                  ),
                ),
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: _imageFile != null
                      ? FileImage(_imageFile!)
                      : const AssetImage("assets/rice.jpg") as ImageProvider,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet(context)),
                  );
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Color.fromARGB(255, 53, 52, 52),
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Anta',
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  _getImage(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
              ),
              IconButton(
                onPressed: () {
                  _getImage(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _getImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }
}