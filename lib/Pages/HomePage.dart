import 'package:codeflink/Pages/Inbox.dart';
import 'package:codeflink/Pages/Message.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          backgroundColor: Colors.purpleAccent,
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
                title: Text("Inbox"),
                leading: Icon(Icons.email),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Inbox())),
              ),
              Divider(
                height: 10,
              ),
              ListTile(
                title: Text("message"),
                leading: Icon(Icons.message),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Message())),
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
      ),
    );
  }
}
