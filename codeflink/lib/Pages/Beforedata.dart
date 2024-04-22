import 'dart:async';

import 'package:codeflink/Pages/CamaraAccess.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: BeforeData(),
  ));
}

class BeforeData extends StatefulWidget {
  const BeforeData({Key? key}) : super(key: key);

  @override
  State<BeforeData> createState() => _BeforeDataState();
}

class _BeforeDataState extends State<BeforeData> {
  late DateTime selectedDate = DateTime.now();
  String liveLocation = 'Location'; // Initial location text
  TextEditingController clientNameController = TextEditingController();
  TextEditingController siteNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startLocationTimer();
  }

  @override
  void dispose() {
    _stopLocationTimer();
    super.dispose();
  }

  // Function to start fetching location periodically
  void _startLocationTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _getLocation();
    });
  }

  // Function to stop fetching location periodically
  void _stopLocationTimer() {
    _timer.cancel();
  }

  // Function to get user's location
  Future<void> _getLocation() async {
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
      // Get location name from coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      // Update liveLocation state with location name
      setState(() {
        liveLocation = placemarks.isNotEmpty
            ? '${placemarks.first.locality},${placemarks.first.postalCode}, ${placemarks.first.country}'
            : 'Unknown Location';
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Details'),
      ),
      body: Center(
        // Wrap the Column with Center widget
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Today Date: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                'Live Location: $liveLocation', // Display liveLocation
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: clientNameController,
                onChanged: (_) => _updateButtonState(),
                decoration: InputDecoration(
                  labelText: 'Client Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: siteNameController,
                onChanged: (_) => _updateButtonState(),
                decoration: InputDecoration(
                  labelText: 'Site Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: phoneNumberController,
                onChanged: (_) => _updateButtonState(),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: emailController,
                onChanged: (_) => _updateButtonState(),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _allFieldsFilled ? _submit : null,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateButtonState() {
    setState(() {});
  }

  bool get _allFieldsFilled {
    return siteNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        clientNameController.text.isNotEmpty;
  }

  void _submit() {
    // Implement your submit logic here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CamAccess()),
    );
  }
}
