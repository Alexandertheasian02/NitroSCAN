import 'package:flutter/material.dart';
import 'package:nitroscan_app/delete_account.page.dart';
import 'package:nitroscan_app/reset_password_page.dart';

class LoginSecurityPage extends StatefulWidget {
  final String username;
  const LoginSecurityPage({super.key, required this.username});

  @override
  _LoginSecurityPageState createState() => _LoginSecurityPageState();
}


class _LoginSecurityPageState extends State<LoginSecurityPage> {
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
              padding: EdgeInsets.only(right: 30.0),
              child: Row(
                children: [
                   Text(
                    'Login & Security',
                    style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'Anta', fontSize: 30, color: Color.fromARGB(255, 122, 255, 89),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Reset Password",
                      style: TextStyle(fontSize: 25,fontFamily: 'Anta', color: Colors.black,fontWeight: FontWeight.w800),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const  Padding(
                      padding: EdgeInsets.only(left:45),
                      child: Text("Reset your password easily by clicking the button.",
                      style: TextStyle(fontSize: 17,fontFamily: 'Anta', color: Colors.white,fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ResetPasswordPage(username: widget.username,)),
                        );
                      },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                        // color: const Color.fromARGB(255, 214, 37, 24),
                        color: const Color.fromARGB(255, 11, 176, 16),
                        borderRadius: BorderRadius.circular(25),                   
                        ),
                        child: const Center(
                          child: Text("Reset Password",
                          style: TextStyle(fontSize: 17,fontFamily: 'Anta', fontWeight: FontWeight.bold, color: Colors.black,),
                          ),
                        ),
                      ),
                    ),
                    ),
                    const SizedBox(height: 60,),
                    const Text("Delete Account",
                    style: TextStyle(fontSize: 25,fontFamily: 'Anta', color: Colors.black,fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 10,),
                    const  Padding(
                      padding: EdgeInsets.only(left:45),
                      child: Text("You won't be able to access some features if you delete your account.",
                      style: TextStyle(fontSize: 17,fontFamily: 'Anta', color: Colors.white,fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DeleteAccountPage(username: widget.username,)),
                        );
                      },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 214, 37, 24),
                        borderRadius: BorderRadius.circular(25),                   
                        ),
                        child: const Center(
                          child: Text("Delete Account",
                          style: TextStyle(fontSize: 17, fontFamily: 'Anta',fontWeight: FontWeight.bold, color: Colors.black,),
                          ),
                        ),
                      ),
                    ),
                    ),
                    const SizedBox(height: 209,)
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}