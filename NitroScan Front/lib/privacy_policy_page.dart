import 'package:flutter/material.dart';
import 'package:nitroscan_app/setting_page.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  PrivacyPolicyPageState createState() => PrivacyPolicyPageState();
}

class PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  bool checkboxValue1 = false;

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
                    'Privacy Policy',
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
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Privacy Policy for NitroScan",
                      style: TextStyle(color: Colors.black,fontSize: 24,fontFamily: 'Anta', fontWeight: FontWeight.w900 ),
                    ),
                    const SizedBox(height: 20,),
                    const Text("1. Data Collection",
                      style: TextStyle(color: Color.fromARGB(255, 219, 214, 214),fontSize: 18,fontFamily: 'Anta', fontWeight: FontWeight.w800 ),
                    ),
                    const SizedBox(height: 20,),
                    const Text("We collect the following types of data from users of NitroScan: ",
                      style: TextStyle(color: Color.fromARGB(255, 219, 214, 214),fontSize: 17,fontFamily: 'Anta', fontWeight: FontWeight.w800 ),
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bulletPointText(
                          "Images: The app captures and processes images taken by the external camera for the purpose of leaf color analysis.",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Text("2. Purpose of Data Collection ",
                      style: TextStyle(color: Color.fromARGB(255, 219, 214, 214),fontSize: 18,fontFamily: 'Anta', fontWeight: FontWeight.w800 ),
                    ),
                    const SizedBox(height: 20,),
                    const Text("We collect data to: ",
                      style: TextStyle(color: Color.fromARGB(255, 219, 214, 214),fontSize: 17,fontFamily: 'Anta', fontWeight: FontWeight.w800 ),
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bulletPointText(
                          "Predict the leaf color chart number.",
                        ),
                        bulletPointText(
                          "Determine nitrogen levels in the soil.",
                        ),
                        bulletPointText(
                          "Provide personalized fertilizer recommendations.",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Text("3. Usage of Data ",
                      style: TextStyle(color: Color.fromARGB(255, 219, 214, 214),fontSize: 18,fontFamily: 'Anta', fontWeight: FontWeight.w800 ),
                    ),
                    const SizedBox(height: 20,),
                    const Text("Collected data is used to improve the accuracy of the color prediction model and to offer users fertilizer recommendations. ",
                      style: TextStyle(color: Color.fromARGB(255, 219, 214, 214),fontSize: 17,fontFamily: 'Anta', fontWeight: FontWeight.w800 ),
                    ),
                    const SizedBox(height: 20,),
                    const Text("4. Storage and Security ",
                      style: TextStyle(color: Color.fromARGB(255, 219, 214, 214),fontSize: 18,fontFamily: 'Anta', fontWeight: FontWeight.w800 ),
                    ),
                    const SizedBox(height: 20,),
                    const Text("We take appropriate measures to secure and protect user data. Data is stored securely and is accessible only to authorized personnel. ",
                      style: TextStyle(color: Color.fromARGB(255, 219, 214, 214),fontSize: 17,fontFamily: 'Anta', fontWeight: FontWeight.w800 ),
                    ),
                    const SizedBox(height: 20,),
                    const Text("5. Third-Party Services ",
                      style: TextStyle(color: Color.fromARGB(255, 219, 214, 214),fontSize: 18,fontFamily: 'Anta', fontWeight: FontWeight.w800 ),
                    ),
                    const SizedBox(height: 20,),
                    const Text("The app may use third-party services or APIs for data processing. Users are encouraged to review the privacy policies of these third-party services. ",
                      style: TextStyle(color: Color.fromARGB(255, 219, 214, 214),fontSize: 17,fontFamily: 'Anta', fontWeight: FontWeight.w800 ),
                    ),
                    const SizedBox(height: 30,),
                    Center(
                      child: buildCheckboxListTile("I agree with the Privacy Policy", checkboxValue1, (value) {
                        setState(() {
                          checkboxValue1 = value!;
                        });
                      }),
                    ),
                    const SizedBox(height: 10,)
                  ],
                ),
              ),
            ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => const SettingPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 18, 196, 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        minimumSize: const Size(150, 30), 
                      ),
                      child: const Text(
                        "Decline",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Anta',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => const SettingPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 18, 196, 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        minimumSize: const Size(150, 30),
                      ),
                      child: const Text(
                        "Accept",
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
      );
  }

  Widget bulletPointText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          " ● ",
          style: TextStyle(
            color: Color.fromARGB(255, 219, 214, 214),
            fontSize: 17,
            fontFamily: 'Anta',
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 219, 214, 214),
              fontSize: 17,
              fontFamily: 'Anta',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCheckboxListTile(
      String title, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "Anta",
          fontSize: 16,
          fontWeight: FontWeight.w600
        ),
      ),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.red,
    );
  }

}