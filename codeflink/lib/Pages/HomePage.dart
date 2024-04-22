import 'package:codeflink/Pages/AcceptedJobCardsPage.dart';
import 'package:codeflink/Pages/Attendence.dart';
import 'package:codeflink/Pages/LocDemo.dart';
import 'package:codeflink/Pages/LoginPageTest.dart';
import 'package:codeflink/Pages/PendingJobCard.dart';
import 'package:codeflink/Pages/Profile.dart';
import 'package:codeflink/Pages/UserProfile.dart';
import 'package:flutter/material.dart';

import 'CamaraAccess.dart';
import 'Inbox.dart';
import 'Trackingorder.dart';

class HomePage extends StatelessWidget {
  final String welcomeMessage;
  HomePage({required this.welcomeMessage});
  // const str = welcomeMessage;

  // const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userRole = welcomeMessage;
    print(userRole);
    return Scaffold(
      appBar: AppBar(
        title: Text('${welcomeMessage}'),
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
            const UserAccountsDrawerHeader(
              accountName: Text('Username'),
              accountEmail: Text("Username@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("lib/Assets/3d/pending.png"),
              ),
            ),
            ListTile(
              title: Text("Home Page"),
              leading: Icon(Icons.home_filled),
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
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Trackingorder()),
              ),
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: Text("Attendence"),
              leading: Icon(Icons.person_2_outlined),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Attendence()),
              ),
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: Text("Current Location"),
              leading: Icon(Icons.location_on_outlined),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LocDemo()),
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
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => CamAccess()),
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
                    // onTap: () {
                    //   Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(
                    //         builder: (context) => Inbox(
                    //             welcomeMessag: "welcomeMessage",
                    //             )),
                    //   );
                    // },
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) =>
                              // Inbox(welcomeMessage: welcomeMessage),
                              Inbox(),
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
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => PendingJobCard()),
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
            SizedBox(height: 40),
            
            //  if(userRole == 'admin'){
            //   Text("Hello world")
            // }
            Visibility(
              visible: userRole ==
                  'admin', // Replace 'condition' with your actual condition
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'EXISTING EMPLOYEE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: userRole == 'admin',
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to other page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserProfile()),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage("lib/Assets/Profile/nithi.jpg"),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nitheshwaran",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Printer",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Implement edit functionality
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to other page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserProfile()),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage("lib/Assets/Profile/mathan.png"),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mathan",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Designer",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     // Navigate to other page
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => UserProfile()),
            //     );
            //   },
            //   child: Card(
            //     elevation: 5,
            //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            //     child: Padding(
            //       padding: EdgeInsets.all(10),
            //       child: Row(
            //         children: [
            //           CircleAvatar(
            //             radius: 30,
            //             backgroundImage:
            //                 AssetImage("lib/Assets/Profile/nithi.jpg"),
            //           ),
            //           SizedBox(width: 20),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 "Nitheshwaran",
            //                 style: TextStyle(
            //                   fontSize: 18,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               Text(
            //                 "Printer",
            //                 style: TextStyle(
            //                   fontSize: 16,
            //                   color: Colors.grey,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Spacer(),
            //           IconButton(
            //             icon: Icon(Icons.edit),
            //             onPressed: () {
            //               // Implement edit functionality
            //             },
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     // Navigate to other page
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => UserProfile()),
            //     );
            //   },
            //   child: Card(
            //     elevation: 5,
            //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            //     child: Padding(
            //       padding: EdgeInsets.all(10),
            //       child: Row(
            //         children: [
            //           CircleAvatar(
            //             radius: 30,
            //             backgroundImage:
            //                 AssetImage("lib/Assets/Profile/mathan.png"),
            //           ),
            //           SizedBox(width: 20),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 "Mathan",
            //                 style: TextStyle(
            //                   fontSize: 18,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               Text(
            //                 "Designer",
            //                 style: TextStyle(
            //                   fontSize: 16,
            //                   color: Colors.grey,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Spacer(),
            //           IconButton(
            //             icon: Icon(Icons.edit),
            //             onPressed: () {},
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
