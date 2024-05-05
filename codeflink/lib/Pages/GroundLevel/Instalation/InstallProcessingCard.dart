import 'package:codeflink/Pages/CommonForAll/HomePage.dart';
import 'package:codeflink/Pages/MemoryContainer.dart';
import 'package:codeflink/Pages/config.dart';
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

class InstallProcessingCard extends StatefulWidget {
  // final String welcomeMessage;
  // InstallProcessingCard({required this.welcomeMessage});

  // const InstallProcessingCard({Key? key}) : super(key: key);

  @override
  State<InstallProcessingCard> createState() => _InstallProcessingCardState();
}

class _InstallProcessingCardState extends State<InstallProcessingCard> {
  List<Memory> memories = [
    Memory(
      event: 'Thamarai Textiles',
      username: 'Mathan',
      text: 'One Of the Best Shop.',
      time: '10:30 AM',
      iconData: Icons.temple_hindu_outlined,
      location: 'Gandhipuram',
    ),
    Memory(
      event: 'Vannam Varities',
      username: 'Pream',
      text: 'One OF the Best Mall in Shop.',
      time: '12:00 PM',
      iconData: Icons.location_city_sharp,
      location: 'Thudiyalur',
    ),
    Memory(
      event: 'Thendral Traders',
      username: 'Nithi',
      text: 'One OF the Best Mall in Shop.',
      time: '12:00 PM',
      iconData: Icons.location_city_sharp,
      location: 'Coimbatore',
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
        // title: Text("Existing Job Card"),
        // title: wantLogo
        //     ? Image.asset(
        //         'lib/Assets/Icon/LOGO.png',
        //         height: 150,
        //         width: 150,
        //       )
        //     : Text('Enter Details'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'lib/Assets/Icon/LOGO.png', // Replace 'your_image.png' with your image path
              height: 100, // Adjust the height as needed
              width: 100, // Adjust the width as needed
            ),
          ),
        ],
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Image.asset(
        //       'lib/Assets/Icon/LOGO.png', // Replace 'your_image.png' with your image path
        //       height: 100, // Adjust the height as needed
        //       width: 100, // Adjust the width as needed
        //     ),
        //   ),
        // ],
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
        return InkWell(
          onTap: () {
            // Handle onTap event
          },
          child: Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.white, // Background color of the card
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        memory.iconData,
                        color: Colors.blue, // Color of the icon
                      ),
                      SizedBox(width: 10),
                      Text(
                        memory.event,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue, // Color of the event text
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    memory.username,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Color of the username text
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    memory.text,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87), // Color of the text
                  ),
                  SizedBox(height: 5),
                  Text(
                    memory.time.toString(),
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey), // Color of the time text
                  ),
                  SizedBox(height: 5),
                  Text(
                    memory.location,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey), // Color of the location text
                  ),
                ],
              ),
            ),
          ),
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
    home: InstallProcessingCard(),
  ));
}
