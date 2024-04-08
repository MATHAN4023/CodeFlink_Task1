// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
//
// void main() {
//   runApp(LocDemo());
// }
//
// class LocDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Location Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LocationDemo(),
//     );
//   }
// }
//
// class LocationDemo extends StatefulWidget {
//   @override
//   _LocationDemoState createState() => _LocationDemoState();
// }
//
// class _LocationDemoState extends State<LocationDemo> {
//   Position? _currentPosition;
//   String? _currentAddress;
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   void _getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         _currentPosition = position;
//         _getAddressFromLatLng();
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   _getAddressFromLatLng() async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//           _currentPosition!.latitude, _currentPosition!.longitude);
//       Placemark place = placemarks[0];
//       setState(() {
//         _currentAddress = "${place.name}, ${place.locality}, ${place.country}";
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Current Location'),
//       ),
//       body: Center(
//         child: _currentPosition != null
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'Latitude: ${_currentPosition!.latitude}',
//                   ),
//                   Text(
//                     'Longitude: ${_currentPosition!.longitude}',
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Address: $_currentAddress',
//                   ),
//                 ],
//               )
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LacDemo extends StatelessWidget {
  const LacDemo({Key? key}) : super(key: key);

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
      ),
      body: Center(
        child: Text(
          'Press the button to get current location.',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _getLocation(context),
        tooltip: 'Get Location',
        child: Icon(Icons.location_on),
      ),
    );
  }
}
