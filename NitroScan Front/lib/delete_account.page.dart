import 'package:flutter/material.dart';
import 'package:nitroscan_app/signin.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  DeleteAccountPageState createState() => DeleteAccountPageState();
}

class DeleteAccountPageState extends State<DeleteAccountPage> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:const Color.fromARGB(255, 8, 111, 11),
          shadowColor: const Color.fromARGB(255, 40, 52, 58),
          elevation: 10,
            actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                   Text(
                    "Delete Account",
                    style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'Anta', fontSize: 30, color: Color.fromARGB(255, 122, 255, 89),
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
                    Color.fromARGB(255, 114, 113, 113),// Right side color
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                    padding: const EdgeInsets.only(left: 50,right: 50,bottom: 30,top: 150),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white, 
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 10),
                        child: TextFormField(
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: 'Enter the Password',
                            hintStyle: const TextStyle(fontFamily: 'Anta',fontWeight: FontWeight.bold,),
                            contentPadding: const EdgeInsets.all(16.0),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    ),
                    const SizedBox(height: 60,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                            MaterialPageRoute(builder: (context) => const Signin()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 18, 196, 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        minimumSize: const Size(220, 50),
                      ),
                      child: const Text(
                        "Delete Account",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Anta',
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 311,)
                  ],
                  ),
              ),
            ),
          ),
      ),
    );
  }
}