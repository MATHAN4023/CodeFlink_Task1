import 'package:codeflink/Pages/GroundLevel/MesurementsEnterDetials.dart';
import 'package:flutter/material.dart';

class Memory {
  final String event;
  final String username;
  final String text;
  final String time;
  final IconData iconData;
  final String location;

  Memory({
    required this.event,
    required this.username,
    required this.text,
    required this.time,
    required this.iconData,
    required this.location,
  });
}

class SelectOutlet extends StatefulWidget {
  @override
  State<SelectOutlet> createState() => _SelectOutletState();
}

class _SelectOutletState extends State<SelectOutlet> {
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
        title: Text('Search Memories'),
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
        return ListTile(
          title: Text(memory.username),
          subtitle: Text(memory.event),
          onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              // builder: (context) => MemoryDetailsPage(memory: memory),
              builder: (context) => MesurementsEnterDetials(),
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
    home: SelectOutlet(),
  ));
}
