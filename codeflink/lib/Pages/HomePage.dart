import 'package:codeflink/Pages/CamaraAccess.dart'; // Import CamAccess
import 'package:codeflink/Pages/Inbox.dart';
import 'package:codeflink/Pages/Message.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.purpleAccent,
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
              accountName: Text("HEllo"),
              accountEmail: Text("XYZ@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("XYZ"),
              ),
            ),
            ListTile(
              title: Text("LIST"),
              leading: Icon(Icons.list),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Inbox()),
              ),
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: Text("message"),
              leading: Icon(Icons.message),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Message()),
              ),
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: Text("LOGOUT"),
              leading: Icon(Icons.message),
              // onTap: () => Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => const Message())),
            ),
            Divider(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
