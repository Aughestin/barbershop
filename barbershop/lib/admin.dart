import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Map<String, String>> reservations = [
    {
      "name": "John Doe",
      "date": "2024-12-08",
      "time": "10:00 AM",
      "model": "Classic Cut",
      "status": "New",
    },
    {
      "name": "Jane Smith",
      "date": "2024-12-09",
      "time": "12:00 PM",
      "model": "Fade Cut",
      "status": "Confirmed",
    },
    {
      "name": "Alice Johnson",
      "date": "2024-12-10",
      "time": "02:00 PM",
      "model": "Buzz Cut",
      "status": "Completed",
    },
    {
      "name": "Bob Brown",
      "date": "2024-12-11",
      "time": "03:00 PM",
      "model": "Fade Cut",
      "status": "Cancelled",
    },
  ];

  void _updateStatus(int index, String status) {
    setState(() {
      reservations[index]["status"] = status;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Reservation updated to $status"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Page"),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reservations List",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: reservations.length,
                itemBuilder: (context, index) {
                  final reservation = reservations[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.brown,
                      ),
                      title: Text("${reservation["name"]}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date: ${reservation["date"]}"),
                          Text("Time: ${reservation["time"]}"),
                          Text("Model: ${reservation["model"]}"),
                          Text("Status: ${reservation["status"]}"),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == "Confirm") {
                            _updateStatus(index, "Confirmed");
                          } else if (value == "Cancel") {
                            _updateStatus(index, "Cancelled");
                          }
                        },
                        itemBuilder: (context) => [
                          if (reservation["status"] == "New") ...[
                            PopupMenuItem(
                              value: "Confirm",
                              child: Text("Confirm"),
                            ),
                            PopupMenuItem(
                              value: "Cancel",
                              child: Text("Cancel"),
                            ),
                          ],
                          if (reservation["status"] == "Confirmed") ...[
                            PopupMenuItem(
                              value: "Cancel",
                              child: Text("Cancel"),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
