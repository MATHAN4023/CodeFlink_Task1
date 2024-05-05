import 'package:codeflink/Pages/AttendanceMaintanance/Attendence.dart';
import 'package:codeflink/Pages/CommonForAll/EmployeeCredential.dart';
import 'package:codeflink/Pages/EmplyeeDetails.dart';
import 'package:codeflink/Pages/GroundLevel/Beforedata.dart';
import 'package:codeflink/Pages/GroundLevel/Instalation/InstallProcessingCard.dart';
import 'package:codeflink/Pages/GroundLevel/MesurementsEnterDetials.dart';
import 'package:codeflink/Pages/LoginPageTest.dart';
import 'package:codeflink/Pages/PendingJobCard.dart';
import 'package:flutter/material.dart';

import '../Inbox.dart';
import '../Trackingorder.dart';

class HomePage extends StatelessWidget {
  final String welcomeMessage;
  HomePage({required this.welcomeMessage});
  // const str = welcomeMessage;

  // const HomePage({Key? key}) : super(key: key);
  String checkUserRole(String input) {
    if (input.contains("design")) {
      return "Designer";
    } else if (input.contains("admin")) {
      return "Admin";
    } else if (input.contains("printer")) {
      return "Printer";
    } else if (input.contains("user")) {
      return "User";
    } else {
      return "guest";
    }
  }

  @override
  Widget build(BuildContext context) {
    // String userRole = welcomeMessage;
    String userRole = checkUserRole(welcomeMessage);
    print(userRole);
    return Scaffold(
      appBar: AppBar(
        // title: Text('${welcomeMessage}'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'lib/Assets/Icon/LOGO.png', // Replace 'your_image.png' with your image path
              height: 100, // Adjust the height as needed
              width: 100, // Adjust the width as needed
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              // accountName: Text('Username'),
              accountName: Text(userRole),
              accountEmail: Text(welcomeMessage),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("lib/Assets/3d/pending.png"),
              ),
            ),
            ListTile(
              // title: Text("Home Page"),
              title: Text("Home Page"),
              leading: Icon(Icons.home_filled),
              // onTap: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => HomePage(
              //       welcomeMessage: welcomeMessage,
              //     ),
              //   ),
              // ),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          welcomeMessage: welcomeMessage,
                        )),
              ),
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: Text("Tracking Order"),
              leading: Icon(Icons.add_chart_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Trackingorder(),
                ),
              ),
              // onTap: () => Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (context) => Trackingorder()),
              // ),
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: Text("Employee Credential"),
              leading: Icon(Icons.lock_person_outlined),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeCredential(),
                ),
              ),
              // onTap: () => Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (context) => Trackingorder()),
              // ),
            ),
            Divider(
              height: 10,
            ),
            if (userRole != 'Admin')
              ListTile(
                title: Text("Attendence"),
                leading: Icon(Icons.person_2_outlined),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Attendence(),
                  ),
                ),
                // onTap: () => Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(builder: (context) => Attendence()),
                // ),
              ),
            if (userRole != 'Admin')
              Divider(
                height: 10,
              ),
            // ListTile(
            //   title: Text("Current Location"),
            //   leading: Icon(Icons.location_on_outlined),
            //   onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => LocDemo(),
            //     ),
            //   ),
            // ),
            // Divider(
            //   height: 10,
            // ),
            if (userRole == 'Admin')
              ListTile(
                title: Text("Employee Rights"),
                leading: Icon(Icons.stay_current_portrait_outlined),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmplyeeDetails(),
                  ),
                ),
              ),
            if (userRole == 'Admin')
              Divider(
                height: 10,
              ),

            Expanded(child: SizedBox()), // Expanded to occupy remaining space
            ListTile(
              title: Text("LOGOUT"),
              leading: Icon(Icons.logout_sharp),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LoginPageTest()),
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
            if (userRole == 'Admin' || userRole == 'User')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BeforeData(),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(72, 100, 246, 1.0),
                              Color.fromRGBO(173, 2, 254, 1.0),
                            ],
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
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Inbox(),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: const LinearGradient(
                            begin: Alignment(-0.5, -1.0),
                            end: Alignment(0.5, 1.0),
                            colors: [
                              Color.fromRGBO(253, 173, 0, 1.0),
                              Color.fromRGBO(233, 109, 44, 1.0),
                            ],
                            stops: [0.1357, 0.9838],
                            transform:
                                GradientRotation(209.21 * 3.14159265 / 180),
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
            SizedBox(height: 20),
            if (userRole == 'Designer')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Inbox(),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(72, 100, 246, 1.0),
                              Color.fromRGBO(173, 2, 254, 1.0),
                            ],
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
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InstallProcessingCard(),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: const LinearGradient(
                            begin: Alignment(-0.5, -1.0),
                            end: Alignment(0.5, 1.0),
                            colors: [
                              Color.fromRGBO(253, 173, 0, 1.0),
                              Color.fromRGBO(233, 109, 44, 1.0),
                            ],
                            stops: [0.1357, 0.9838],
                            transform:
                                GradientRotation(209.21 * 3.14159265 / 180),
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
                                  'Pending Job',
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
            SizedBox(height: 20),
            if (userRole == 'Admin')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PendingJobCard(),
                          ),
                        );
                      },
                      child: Container(
                        width: 320,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: const LinearGradient(
                            begin: Alignment(-0.5, -1.0),
                            end: Alignment(0.5, 1.0),
                            colors: [
                              Color.fromRGBO(74, 210, 149, 1.0),
                              Color.fromRGBO(20, 156, 78, 1.0)
                            ],
                            stops: [0.1357, 0.9838],
                            transform:
                                GradientRotation(209.21 * 3.14159265 / 180),
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
            // SizedBox(height: 20),
            if (userRole == 'User')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MesurementsEnterDetials(),
                          ),
                        );
                      },
                      child: Container(
                        width: 320,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: const LinearGradient(
                            begin: Alignment(-0.5, -1.0),
                            end: Alignment(0.5, 1.0),
                            colors: [
                              Color.fromRGBO(255, 183, 157, 1),
                              Color.fromRGBO(163, 71, 13, 1)
                            ],
                            stops: [0.1357, 0.9838],
                            transform:
                                GradientRotation(209.21 * 3.14159265 / 180),
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
                                  'Mesurements',
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
            SizedBox(height: 20),
            if (userRole == 'User')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InstallProcessingCard(),
                          ),
                        );
                      },
                      child: Container(
                        width: 320,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: const LinearGradient(
                            begin: Alignment(-0.5, -1.0),
                            end: Alignment(0.5, 1.0),
                            colors: [
                              Color.fromRGBO(157, 178, 255, 1),
                              Color.fromRGBO(13, 48, 163, 1)
                            ],
                            stops: [0.1357, 0.9838],
                            transform:
                                GradientRotation(209.21 * 3.14159265 / 180),
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
                                  'Installation',
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
            SizedBox(height: 20),
            if (userRole == 'Printer')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcceptedCardsPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 320,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: const LinearGradient(
                            begin: Alignment(-0.5, -1.0),
                            end: Alignment(0.5, 1.0),
                            colors: [
                              Color.fromRGBO(246, 249, 182, 1),
                              Color.fromRGBO(255, 251, 1, 1)
                            ],
                            stops: [0.1357, 0.9838],
                            transform:
                                GradientRotation(209.21 * 3.14159265 / 180),
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
                                  'Printing Phase',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            // Positioned(
                            //   bottom: 10,
                            //   left: 135,
                            //   child: Container(
                            //     width: 40,
                            //     height: 40,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       color: Colors.grey[300],
                            //     ),
                            //     child: Icon(
                            //       Icons.star,
                            //       color: Colors.blueGrey,
                            //       size: 30,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20),
            if (userRole == 'Admin')
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmplyeeDetails(),
                          ),
                        );
                      },
                      child: Container(
                        width: 320,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: const LinearGradient(
                            begin: Alignment(-0.5, -1.0),
                            end: Alignment(0.5, 1.0),
                            colors: [
                              Color.fromRGBO(194, 27, 206, 1.0),
                              Color.fromRGBO(187, 65, 196, 1.0)
                            ],
                            stops: [0.1357, 0.9838],
                            transform:
                                GradientRotation(209.21 * 3.14159265 / 180),
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Positioned.fill(
                            //   child: Align(
                            //     alignment: Alignment.topCenter,
                            //     child: Image.asset(
                            //       'lib/Assets/3d/pending.png',
                            //       width: 130,
                            //       height: 130,
                            //     ),
                            //   ),
                            // ),
                            const Positioned.fill(
                              child: Align(
                                // alignment: Alignment(0, 0.3),
                                child: Text(
                                  'Employee Dashboard',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                            ),
                            // Positioned(
                            //   bottom: 10,
                            //   left: 135,
                            //   child: Container(
                            //     width: 40,
                            //     height: 40,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       color: Colors.grey[300],
                            //     ),
                            //     child: Icon(
                            //       Icons.star,
                            //       color: Colors.blueGrey,
                            //       size: 30,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
