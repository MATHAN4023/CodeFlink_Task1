import 'package:codeflink/Pages/HomePage.dart';
import 'package:flutter/material.dart';

enum UserRole {
  admin,
  user,
  guest,
}

class AuthService {
  // Simulate authentication process
  Future<UserRole?> login(String username, String password) async {
    // Your authentication logic goes here
    // For demo, return a hardcoded role based on username/password
    if (username == "admin" && password == "admin") {
      return UserRole.admin;
    } else if (username == "user" && password == "user") {
      return UserRole.user;
    } else {
      return null; // Invalid credentials
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

class LoginPageTest extends StatelessWidget {
  final AuthService authService = AuthService();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            // TextField(
            //   controller: usernameController,
            //   decoration: InputDecoration(labelText: 'Username'),
            // ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            // TextField(
            //   controller: passwordController,
            //   decoration: InputDecoration(labelText: 'Password'),
            //   obscureText: true,
            // ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                final username = usernameController.text;
                final password = passwordController.text;
                final role = await authService.login(username, password);
                if (role != null) {
                  String welcomeMessage = '';
                  if (role == UserRole.admin) {
                    welcomeMessage = username;
                  } else if (role == UserRole.user) {
                    welcomeMessage = username;
                  }

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => WelcomePage(
                  //       welcomeMessage: welcomeMessage,
                  //     ),
                  //   ),
                  // );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        welcomeMessage: welcomeMessage,
                      ),
                    ),
                  );
                } else {
                  // Show error message
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
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPageTest(),
  ));
}
