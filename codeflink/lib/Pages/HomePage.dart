import 'package:codeflink/Pages/MyApp.dart';
import 'package:codeflink/Pages/PendingJobCard.dart';
import 'package:flutter/material.dart';

import 'CamaraAccess.dart';
import 'Inbox.dart';
import 'LoginPage.dart';
import 'Trackingorder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("lib/Assets/3d/pending.png"),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // otherAccountsPictures: [
              //   CircleAvatar(
              //     child: (Text("Hi")),
              //   )
              // ],
              accountName: Text("Admin"),
              accountEmail: Text("Test@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("lib/Assets/3d/pending.png"),
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
              title: Text("Tracking Order"),
              leading: Icon(Icons.add_chart_rounded),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Trackingorder()),
              ),
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: Text("Current Location"),
              leading: Icon(Icons.location_on_outlined),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MyApp()),
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
                MaterialPageRoute(builder: (context) => const LoginPage()),
              ),
            ),
            Divider(
              height: 10,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(25.0), // Set border radius here
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => CamAccess()),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 200, // Increase the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(72, 100, 246, 1.0),
                            Color.fromRGBO(173, 2, 254, 1.0),
                          ], // Change colors as needed
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'lib/Assets/3d/newjob.png',
                                width: 130,
                                height: 130,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment(0, 0.3),
                              child: Text(
                                'New Job card',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 55,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                              child: Icon(
                                Icons.star,
                                color: Colors.blueGrey,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(25.0), // Set border radius here
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Inbox()),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 200, // Increase the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        gradient: const LinearGradient(
                          begin: Alignment(-0.5, -1.0), // Begin from top-left
                          end: Alignment(0.5, 1.0), // End at bottom-right
                          colors: [
                            Color.fromRGBO(253, 173, 0, 1.0),
                            Color.fromRGBO(233, 109, 44, 1.0),
                          ],
                          stops: [
                            0.1357,
                            0.9838
                          ], // Percentage stops for colors
                          transform: GradientRotation(209.21 *
                              3.14159265 /
                              180), // Convert degree to radians
                        ),
                      ),

                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'lib/Assets/3d/existing.png',
                                width: 130,
                                height: 130,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment(0, 0.3),
                              child: Text(
                                'Existing Job',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 55,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                              child: Icon(
                                Icons.star,
                                color: Colors.blueGrey,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Add some space between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(25.0), // Set border radius here
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => PendingJobCard()),
                      );
                    },
                    child: Container(
                      width: 320,
                      height: 200, // Increase the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        gradient: const LinearGradient(
                          begin: Alignment(-0.5, -1.0), // Begin from top-left
                          end: Alignment(0.5, 1.0), // End at bottom-right
                          colors: [
                            Color.fromRGBO(74, 210, 149, 1.0), // Lighter green
                            Color.fromRGBO(20, 156, 78, 1.0)
                          ],
                          stops: [
                            0.1357,
                            0.9838
                          ], // Percentage stops for colors
                          transform: GradientRotation(209.21 *
                              3.14159265 /
                              180), // Convert degree to radians
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'lib/Assets/3d/pending.png',
                                width: 130,
                                height: 130,
                              ),
                            ),
                          ),
                          const Positioned.fill(
                            child: Align(
                              alignment: Alignment(0, 0.3),
                              child: Text(
                                'Pending Job card',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            // right: 55,
                            left: 135,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                              child: Icon(
                                Icons.star,
                                color: Colors.blueGrey,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
