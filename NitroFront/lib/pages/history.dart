import 'package:flutter/material.dart';
import 'package:nitroscan_app/clear_data.dart';
import 'package:nitroscan_app/history_details.dart';

class HistoryPage extends StatefulWidget {
  final String username;
  const HistoryPage({super.key, required this.username});

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 8, 111, 11),
          shadowColor: const Color.fromARGB(255, 40, 52, 58),
          elevation: 10,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 50.0),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Filter by date',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: "Anta",
                    fontWeight: FontWeight.w800,
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Anta",
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: historyData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            title: Text(
                              historyData[index]['date']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
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
                              builder: (context) =>  ClearDataPage(username: widget.username,),
                            ),
                          );
                        },
                        child: const Row(
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
                                fontWeight: FontWeight.w800
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
        ),
      ),
    );
  }

  void dropdownCallback(String value) {
    // Implement logic based on the selected dropdown value
  }
}
