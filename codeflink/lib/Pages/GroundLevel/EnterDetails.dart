import 'dart:async';

import 'package:codeflink/Pages/Inbox.dart';
import 'package:codeflink/Pages/PendingJobCard.dart';
import 'package:codeflink/Pages/config.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: EnterDetails(),
  ));
}

class EnterDetails extends StatefulWidget {
  const EnterDetails({Key? key}) : super(key: key);

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  late DateTime selectedDate = DateTime.now();
  String liveLocation = 'Location'; // Initial location text
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController BreathController = TextEditingController();
  TextEditingController PoolController = TextEditingController();
  TextEditingController ClampController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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

  // bool wantLogo = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: wantLogo
            ? Image.asset(
                'lib/Assets/Icon/LOGO.png',
                height: 150,
                width: 150,
              )
            : Text('Enter Details'),
      ),
      body: SingleChildScrollView(
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
              controller: heightController,
              onChanged: (_) => _updateButtonState(),
              decoration: InputDecoration(
                labelText: 'Height',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: widthController,
              onChanged: (_) => _updateButtonState(),
              decoration: InputDecoration(
                labelText: 'Width',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: BreathController,
              onChanged: (_) => _updateButtonState(),
              decoration: InputDecoration(
                labelText: 'Breath',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: PoolController,
              onChanged: (_) => _updateButtonState(),
              decoration: InputDecoration(
                labelText: 'Pole',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: ClampController,
              onChanged: (_) => _updateButtonState(),
              decoration: InputDecoration(
                labelText: 'Clamp',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: descriptionController,
              onChanged: (_) => _updateButtonState(),
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Description',
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
    );
  }

  void _updateButtonState() {
    setState(() {});
  }

  bool get _allFieldsFilled {
    return heightController.text.isNotEmpty &&
        widthController.text.isNotEmpty &&
        PoolController.text.isNotEmpty &&
        ClampController.text.isNotEmpty &&
        BreathController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
  }

  void _submit() {
    // print('Submit Button Pressed');
    // Navigate to another page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Inbox()),
    );
  }
}
