import 'package:flutter/material.dart';
import 'package:opensocial/features/profile/presentation/requests/see_applicants.dart';

class DateRequestsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> dateRequests = [
    {
      "title": "Movie Date",
      "description": "Looking forward to watching the new Marvel movie.",
      "location": "AMC Theaters",
      "dateTime": "2023-11-10 7:00 PM",
    },
    {
      "title": "Coffee Date",
      "description": "Let's catch up over coffee this weekend.",
      "location": "Starbucks on Main St.",
      "dateTime": "2023-11-12 10:00 AM",
    },
    {
      "title": "Prom Date",
      "description": "Prom night! Excited to go together.",
      "location": "City High School Gym",
      "dateTime": "2023-12-01 8:00 PM",
    },
    // Add more date requests as needed
  ];

  DateRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Date Requests"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Create Date Request Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle "Create Date Request" action
                // Navigate to the "Create Date Request" screen or open a dialog
              },
              icon: const Icon(Icons.add),
              label: const Text("Create Date Request"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // List of Date Requests
            Expanded(
              child: ListView.builder(
                itemCount: dateRequests.length,
                itemBuilder: (context, index) {
                  final request = dateRequests[index];
                  return _buildDateRequestCard(context, request);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateRequestCard(
      BuildContext context, Map<String, dynamic> request) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title, Date-Time and Menu Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    request['title'],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  request['dateTime'],
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (String value) {
                    switch (value) {
                      case 'Completed':
                        // Handle "Completed" action
                        break;
                      case 'Edit':
                        // Handle "Edit" action
                        break;
                      case 'Delete':
                        // Handle "Delete" action
                        break;
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 'Completed',
                      child: Text('Completed'),
                    ),
                    const PopupMenuItem(
                      value: 'Edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem(
                      value: 'Delete',
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Description
            Text(
              request['description'],
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),

            // Location
            Row(
              children: [
                const Icon(Icons.location_pin, color: Colors.blue, size: 18),
                const SizedBox(width: 4),
                Text(
                  request['location'],
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // "See All Applications" Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ApplicantsPage(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "See All Applications",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
