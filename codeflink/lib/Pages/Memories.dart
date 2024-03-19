import 'package:codeflink/Pages/MemoryContainer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MemoriesApp());
}

class MemoriesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memories App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Memories(),
    );
  }
}

class Memories extends StatefulWidget {
  const Memories({Key? key}) : super(key: key);

  @override
  State<Memories> createState() => _MemoriesState();
}

class _MemoriesState extends State<Memories> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? _buildSearchField() : Text('Memories'),
        backgroundColor: Colors.purpleAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (_isSearching) {
              setState(() {
                _isSearching = false;
              });
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
            },
            icon: _isSearching ? Icon(Icons.close) : Icon(Icons.search),
          ),
        ],
      ),
      body: _isSearching ? _buildSearchResults() : _buildMemoriesList(),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: TextStyle(color: Colors.white70),
      ),
      style: TextStyle(color: Colors.white),
      onChanged: (query) {
        // Handle search query changes
      },
    );
  }

  Widget _buildSearchResults() {
    // Replace this with your search results widget
    return Center(
      child: Text('Search Results'),
    );
  }

  Widget _buildMemoriesList() {
    return ListView(
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
                builder: (context) => MemoryContainer1(),
              ),
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
                builder: (context) => MemoryContainer1(),
              ),
            );
          },
        ),
        // Add more MemoryContainer widgets as needed
      ],
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

// class MemoryContainer1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Memory Details'),
//       ),
//       body: Container(
//         child: Center(
//           child: Text('Memory Container 1'),
//         ),
//       ),
//     );
//   }
// }
