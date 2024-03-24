import 'package:flutter/material.dart';
import 'package:nitroscan_app/setting_page.dart';

class ClearDataPage extends StatefulWidget {
  final String username;
  const ClearDataPage({super.key,required this.username});

  @override
  ClearDataPageState createState() => ClearDataPageState();
}

class ClearDataPageState extends State<ClearDataPage> {
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  bool checkboxValue5 = false;

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
              padding: EdgeInsets.only(right: 30.0),
              child: Row(
                children: [
                  Text(
                    'Clear Data',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Anta',
                      fontSize: 30,
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select items to clear:',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Anta",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      buildCheckboxListTile('Cookies', checkboxValue1, (value) {
                        setState(() {
                          checkboxValue1 = value!;
                        });
                      }),
                      buildCheckboxListTile('Cached data', checkboxValue2,
                          (value) {
                        setState(() {
                          checkboxValue2 = value!;
                        });
                      }),
                      buildCheckboxListTile('Favourites', checkboxValue3,
                          (value) {
                        setState(() {
                          checkboxValue3 = value!;
                        });
                      }),
                      buildCheckboxListTile(
                          'Passwords and other sign-in data', checkboxValue4,
                          (value) {
                        setState(() {
                          checkboxValue4 = value!;
                        });
                      }),
                      buildCheckboxListTile('Autofill data', checkboxValue5,
                          (value) {
                        setState(() {
                          checkboxValue5 = value!;
                        });
                      }),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingPage(username: widget.username,),
                            ),
                          );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 57, 220, 79),
                        ),
                      ),
                      child: const Text(
                        'Clear Data',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Anta",
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 179,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCheckboxListTile(
      String title, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: "Anta",
          fontWeight: FontWeight.w900,
          fontSize: 17,
        ),
      ),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.lime,
    );
  }
}