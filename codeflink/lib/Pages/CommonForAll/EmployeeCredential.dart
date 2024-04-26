import 'package:flutter/material.dart';

class EmployeeCredential extends StatefulWidget {
  const EmployeeCredential({Key? key}) : super(key: key);

  @override
  State<EmployeeCredential> createState() => _EmployeeCredentialState();
}

class _EmployeeCredentialState extends State<EmployeeCredential> {
  List<String> moduleNames = [
    'Employee Dashboard',
    'New Job Card',
    'Existing Job Card',
    'Pending Job Card',
  ];

  List<bool> accessAllowed = [true, false, false, true, false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employee Credential')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('MODULES NAME',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                // Text('Restrict', style: TextStyle(fontWeight: FontWeight.bold)),
                // Text('Allowed', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          for (int i = 0; i < moduleNames.length; i++)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(moduleNames[i])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text('Yes'),
                          Radio(
                            value: true,
                            groupValue: accessAllowed[i],
                            onChanged: (value) {
                              setState(() {
                                accessAllowed[i] = value as bool;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('No'),
                          Radio(
                            value: false,
                            groupValue: accessAllowed[i],
                            onChanged: (value) {
                              setState(() {
                                accessAllowed[i] = value as bool;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: EmployeeCredential()));
}
