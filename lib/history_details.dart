import 'package:flutter/material.dart';

class HistoryDetailsPage extends StatelessWidget {
  final List<Map<String, String>> details;

  const HistoryDetailsPage({super.key, required this.details});

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
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Anta",
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Display captured image
                        details[index]['image'] != null
                            ? Image.network(details[index]['image']!)
                            : const SizedBox.shrink(),
                        const SizedBox(height: 16),
                        const Text(
                          'LCC Number:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Anta",
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          details[index]['lccNumber'] ?? 'Not Available',
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Anta",
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Required Amount of Nitrogen:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Anta",
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          details[index]['requiredNitrogen'] ?? 'Not Available',
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Anta",
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Suggestions:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Anta",
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          details[index]['suggestions'] ?? 'Not Available',
                          style: const TextStyle(
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
        ),
      ),
    );
  }
}