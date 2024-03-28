import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // Import geolocator package

import 'CamaraAccess.dart'; // Import CamAccess
import 'Inbox.dart';
import 'LoginPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Function to get user's location
  Future<void> _getLocation(BuildContext context) async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled.');
        return;
      }

      // Request location permission
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permission is denied.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print(
            'Location permissions are permanently denied, we cannot request permissions.');
        return;
      }

      // Get user's current location
      Position position = await Geolocator.getCurrentPosition();
      // Display latitude and longitude in a dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Current Location'),
            content: Text(
                'Latitude: ${position.latitude}\nLongitude: ${position.longitude}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.camera),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const CamAccess()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              otherAccountsPictures: [
                CircleAvatar(
                  child: (Text("Hi")),
                )
              ],
              accountName: Text("Test"),
              accountEmail: Text("Test@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("Test"),
              ),
            ),
            ListTile(
              title: Text("Home Page"),
              leading: Icon(Icons.home_filled),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage()),
              ),
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: Text("Existing Job card"),
              leading: Icon(Icons.card_travel),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Inbox()),
              ),
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: Text("New Job card"),
              leading: Icon(Icons.add_chart_rounded),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const CamAccess()),
              ),
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: Text("Pending Job Card"),
              leading: Icon(Icons.pending_actions),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Inbox()),
              ),
            ),
            Divider(
              height: 10,
            ),
            Expanded(child: SizedBox()), // Expanded to occupy remaining space
            ListTile(
              title: Text("LOGOUT"),
              leading: Icon(Icons.logout_sharp),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginPage())),
            ),
            Divider(
              height: 10,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Your existing scaffold
          Scaffold(
            // Add any existing body content here
            body: Center(
              child: Text(
                'WELCOME',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          // Positioned widget to show location at the center
          Positioned(
            bottom: 16, // Adjust position as needed
            left: 0,
            right: 0,
            child: FloatingActionButton(
              onPressed: () =>
                  _getLocation(context), // Call _getLocation function
              tooltip: 'Get Location',
              child: Icon(Icons.location_on),
            ),
          ),
        ],
      ),
    );
  }
}
