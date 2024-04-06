import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class EnterDetails extends StatefulWidget {
  const EnterDetails({Key? key}) : super(key: key);

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  late DateTime selectedDate = DateTime.now();
  TextEditingController siteNameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
        title: Text('Enter Details'),
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
              'Live Location: Location',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: siteNameController,
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
              controller: widthController,
              onChanged: (_) => _updateButtonState(),
              decoration: InputDecoration(
                labelText: 'Breath',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: widthController,
              onChanged: (_) => _updateButtonState(),
              decoration: InputDecoration(
                labelText: 'Clamp',
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
      ),
    );
  }

  void _updateButtonState() {
    setState(() {});
  }

  bool get _allFieldsFilled {
    return siteNameController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        widthController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
  }

  void _submit() {
    // Implement your submit logic here
    print('Submit Button Pressed');
  }
}

void main() {
  runApp(MaterialApp(
    home: EnterDetails(),
  ));
}
