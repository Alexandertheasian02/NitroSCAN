import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String dropdownValue = 'All'; // Default dropdown value

  // Dummy data for history
  List<Map<String, dynamic>> historyData = [
    {
      'date': '2024-03-01',
      'details': [
        {
          'image': 'https://via.placeholder.com/150',
          'lccNumber': '123456',
          'requiredNitrogen': '100',
          'suggestions': 'Some suggestions...'
        },
        {
          'image': 'https://via.placeholder.com/150',
          'lccNumber': '789012',
          'requiredNitrogen': '150',
          'suggestions': 'More suggestions...'
        },
      ]
    },
    {'date': '2024-02-29', 'details': []}, // Example with no details
    // Add more history data here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'History',
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
      backgroundColor: const Color.fromARGB(255, 8, 111, 11),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Filter by date',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: "Anta",
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              dropdownColor: Colors.black,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                  dropdownCallback(newValue);
                }
              },
              items: <String>['All', 'Last Week', 'Last Month', 'Last Year']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Anta",
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: historyData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        title: Text(
                          historyData[index]['date']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Anta",
                          ),
                        ),
                        onTap: () {
                          // Handle tap on history item
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HistoryDetailsPage(
                                details: List<Map<String, String>>.from(
                                    historyData[index]['details']),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClearDataPage(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Clear Data',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "Anta",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dropdownCallback(String value) {
    // Implement logic based on the selected dropdown value
    print('Selected option: $value');
  }
}

class HistoryDetailsPage extends StatelessWidget {
  final List<Map<String, String>> details;

  HistoryDetailsPage({required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Details',
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
      backgroundColor: const Color.fromARGB(255, 8, 111, 11),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: details.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Captured Image ${index + 1}:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Anta",
                      ),
                    ),
                    SizedBox(height: 8),
                    // Display captured image
                    details[index]['image'] != null
                        ? Image.network(details[index]['image']!)
                        : SizedBox.shrink(),
                    SizedBox(height: 16),
                    Text(
                      'LCC Number:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Anta",
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      details[index]['lccNumber'] ?? 'Not Available',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Anta",
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Required Amount of Nitrogen:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Anta",
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      details[index]['requiredNitrogen'] ?? 'Not Available',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Anta",
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Suggestions:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Anta",
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      details[index]['suggestions'] ?? 'Not Available',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Anta",
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ClearDataPage extends StatefulWidget {
  @override
  _ClearDataPageState createState() => _ClearDataPageState();
}

class _ClearDataPageState extends State<ClearDataPage> {
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  bool checkboxValue5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: const Color.fromARGB(255, 8, 111, 11),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select items to clear:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Anta",
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic to clear data here
              },
              child: Text(
                'Clear Data',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Anta",
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 57, 220, 79),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCheckboxListTile(
      String title, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Anta",
        ),
      ),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.lime,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HistoryPage(),
  ));
}
