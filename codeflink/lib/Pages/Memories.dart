import 'package:flutter/material.dart';

import 'memory_data.dart';

class MemoryContainer extends StatelessWidget {
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
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
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
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5),
                    Text(
                      event,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Username: $username",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Description: $text",
                  style: TextStyle(fontSize: 16),
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
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MemoryContainer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memory Details"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Text("Memory Details Screen"),
      ),
    );
  }
}

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
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
                labelText: 'Search Memories',
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
    home: Inbox(),
  ));
}
