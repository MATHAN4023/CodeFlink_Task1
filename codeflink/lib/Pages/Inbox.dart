import 'package:codeflink/Pages/HomePage.dart';
import 'package:codeflink/Pages/MemoryContainer.dart';
import 'package:flutter/material.dart';

class Memory {
  final String event;
  final String username;
  final String text;
  final String time;
  final IconData iconData;
  final String location; // New field for location

  Memory({
    required this.event,
    required this.username,
    required this.text,
    required this.time,
    required this.iconData,
    required this.location,
  });
}

class MemoryContainer extends StatelessWidget {
  // final String welcomeMessage;

  final String event;
  final String username;
  final String text;
  final String time;
  final IconData iconData;
  final String location;
  final VoidCallback onTap;

  MemoryContainer({
    required this.event,
    required this.username,
    required this.text,
    required this.time,
    required this.iconData,
    required this.location,
    required this.onTap,
    // required this.welcomeMessage
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    iconData,
                    color: Colors.redAccent,
                  ),
                  SizedBox(width: 10),
                  Text(
                    event,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Username: $username",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Description: $text",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 5),
              Text(
                "Location: $location",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 5),
              Text(
                "Time: $time",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Inbox extends StatefulWidget {
  final String welcomeMessage;
  Inbox({required this.welcomeMessage});

  // const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List<Memory> memories = [
    Memory(
      event: 'Meenakshi Temple',
      username: 'Mathan',
      text: 'One Of the Best Temple.',
      time: '10:30 AM',
      iconData: Icons.temple_hindu_outlined,
      location: 'Madurai',
    ),
    Memory(
      event: 'Vishald mall 1',
      username: 'Nithesh',
      text: 'One OF the Best Mall in Madurai.',
      time: '12:00 PM',
      iconData: Icons.location_city_sharp,
      location: 'Madurai',
    ),
    Memory(
      event: 'Vishald mall 2',
      username: 'Ritcherd',
      text: 'One OF the Best Mall in Madurai.',
      time: '12:00 PM',
      iconData: Icons.location_city_sharp,
      location: 'Madurai',
    ),
    Memory(
      event: 'Vishald mall 3',
      username: 'Rammm',
      text: 'One OF the Best Mall in Madurai.',
      time: '12:00 PM',
      iconData: Icons.location_city_sharp,
      location: 'Madurai',
    ),
    // Add more Memory objects as needed
  ];

  List<Memory> filteredMemories = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredMemories = memories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Existing Job Card"),
        //------- backgroundColor: Colors.redAccent,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const HomePage()),
        //     );
        //   },
        // ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterMemories(value);
              },
              decoration: InputDecoration(
                labelText: 'Search Jobs',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: _buildMemoriesList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMemoriesList() {
    return ListView.builder(
      itemCount: filteredMemories.length,
      itemBuilder: (context, index) {
        Memory memory = filteredMemories[index];
        return MemoryContainer(
          event: memory.event,
          username: memory.username,
          text: memory.text,
          time: memory.time,
          iconData: memory.iconData,
          location: memory.location,
          // welcomeMessage: "memory",

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MemoryContainer1(),
              ),
            );
          },
        );
      },
    );
  }

  void filterMemories(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredMemories = memories
            .where((memory) =>
                memory.username.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredMemories = memories;
      }
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: Inbox(welcomeMessage: ''),
  ));
}
