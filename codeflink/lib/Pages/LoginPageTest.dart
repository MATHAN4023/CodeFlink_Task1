import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import LatLng
import 'package:location/location.dart' as location;
import 'package:location/location.dart';

import 'CommonForAll/HomePage.dart';

enum UserRole {
  admin,
  user,
  guest,
  printer,
}

class AuthService {
  final location.Location _location = location.Location();
  LocationData? currentLocation;
  static String? locationName; // Declare locationName as a static variable

  Future<UserRole?> login(
      String username, String password, String machineId) async {
    if (username == "admin" && password == "admin") {
      return UserRole.admin;
    } else if (username == "user" && password == "user") {
      return UserRole.user;
    } else if (username == "printer" &&
        password == "printer" &&
        machineId == "123") {
      // print("object");
      return UserRole.printer;
    } else {
      return null;
    }
  }

  Future<void> fetchLocation() async {
    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      location.PermissionStatus permissionGranted =
          await _location.hasPermission();
      if (permissionGranted != location.PermissionStatus.granted) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != location.PermissionStatus.granted) {
          return;
        }
      }

      LocationData locationData = await _location.getLocation();
      currentLocation = locationData;
      print(
          'Location - Latitude: ${currentLocation!.latitude}, Longitude: ${currentLocation!.longitude}');

      final coordinates = LatLng(
        currentLocation!.latitude!,
        currentLocation!.longitude!,
      );
      final addresses = await placemarkFromCoordinates(
          coordinates.latitude, coordinates.longitude);
      if (addresses.isNotEmpty) {
        final address = addresses.first;
        locationName = address.street;
        print('Location Name: $locationName');
      }
    } catch (e) {
      print("Error getting location: $e");
      return;
    }
  }
}

class WelcomePage extends StatelessWidget {
  final String welcomeMessage;

  WelcomePage({required this.welcomeMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Text(
          welcomeMessage,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class LoginPageTest extends StatefulWidget {
  @override
  _LoginPageTestState createState() => _LoginPageTestState();
}

class _LoginPageTestState extends State<LoginPageTest> {
  final AuthService authService = AuthService();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController machineIdController = TextEditingController();
  bool showPassword = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'lib/Assets/Icon/LOGO.png',
                height: 50.0,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              obscureText: !showPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            if (isChecked)
              TextFormField(
                controller: machineIdController,
                // obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: 'Machine ID',
                  border: OutlineInputBorder(),
                  // suffixIcon: IconButton(
                  //   icon: Icon(
                  //     showPassword ? Icons.visibility : Icons.visibility_off,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       showPassword = !showPassword;
                  //     });
                  //   },
                  // ),
                ),
              ),
            SizedBox(height: 20.0),
            CheckboxListTile(
              title: Text(
                "Printing Phase Employee",
                style: TextStyle(color: Colors.blue),
              ),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                  if (!isChecked) {
                    // Clear the password controller when checkbox is unchecked
                    machineIdController;
                  }
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                _loginAndFetchLocation();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loginAndFetchLocation() async {
    final username = usernameController.text;
    final password = passwordController.text;
    final machineId = machineIdController.text;
    final role = await authService.login(username, password, machineId);
    if (role != null) {
      String welcomeMessage = '';
      if (role == UserRole.admin ||
          role == UserRole.user ||
          role == UserRole.printer) {
        welcomeMessage = username;
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(
            welcomeMessage: welcomeMessage,
          ),
        ),
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => HomePage(
      //       welcomeMessage: welcomeMessage,
      //     ),
      //   ),
      // );

      await authService.fetchLocation();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPageTest(),
  ));
}
