import 'package:flutter/material.dart';

import 'MemoryContainer.dart';

class Memories extends StatefulWidget {
  const Memories({Key? key}) : super(key: key);
  @override
  State<Memories> createState() => _MemoriesState();
}

class _MemoriesState extends State<Memories> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Memories'),
          backgroundColor: Colors.purpleAccent,
        ),
        body: ListView(
          children: [
            MemoryContainer(
              username: 'Meenakshi Temple',
              text: 'One Of the Best Temple.',
              time: '10:30 AM',
              iconData: Icons.temple_hindu_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MemoryContainer1()), // Replace NextPage() with the page you want to navigate to
                );
              },
            ),
            MemoryContainer(
              username: 'Vishald mall',
              text: 'One OF the Best Mall in Madurai.',
              time: '12:00 PM',
              iconData: Icons.location_city_sharp,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MemoryContainer1()), // Replace NextPage() with the page you want to navigate to
                );
              },
            ),
            // Add more MemoryContainer widgets as needed
          ],
        ),
      ),
    );
  }
}

class MemoryContainer extends StatelessWidget {
  final String username;
  final String text;
  final String time;
  final IconData iconData;
  final VoidCallback onTap;

  MemoryContainer({
    required this.username,
    required this.text,
    required this.time,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                username[0],
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    text,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // You can keep this if you want to add functionality to the icon button
              },
              icon: Icon(iconData),
            ),
          ],
        ),
      ),
    );
  }
}
