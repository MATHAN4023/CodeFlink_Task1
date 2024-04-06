import 'package:flutter/material.dart';

import 'CamaraAccess.dart';
import 'Inbox.dart';
import 'LoginPage.dart';
import 'PendingJobCard.dart';
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
              title: Text("Tracking Order"),
              leading: Icon(Icons.add_chart_rounded),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Trackingorder()),
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
                      width: 180,
                      height: 250, // Increase the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                          image: const AssetImage(
                              'lib/Assets/JobCard/New_job.png'), // Add your image asset path
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.50),
                              BlendMode
                                  .dstATop), // Adjust opacity here (0.5 means 50% opacity)
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'New Job card',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
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
                        MaterialPageRoute(builder: (context) => const Inbox()),
                      );
                    },
                    child: Container(
                      width: 180,
                      height: 250, // Increase the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                          image: const AssetImage(
                              'lib/Assets/JobCard/ExistingJob.png'), // Add your image asset path
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.50),
                              BlendMode
                                  .dstATop), // Adjust opacity here (0.5 means 50% opacity)
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Existing Job card',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Add some space between rows
            SizedBox(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(25.0), // Set border radius here
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => PendingJobCard()),
                    );
                  },
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      image: DecorationImage(
                        image: AssetImage('lib/Assets/JobCard/pendingjob.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.50),
                          BlendMode.dstATop,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Pending Job card',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
