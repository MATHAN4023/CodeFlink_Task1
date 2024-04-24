import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Attendence extends StatefulWidget {
  @override
  State<Attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  List<Map<String, dynamic>> attendanceData = [];

  @override
  void initState() {
    super.initState();
    // Add some initial dummy data
    attendanceData.addAll([
      {
        'Date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'Time': DateFormat('kk:mm').format(DateTime.now()),
        'Check Status': 'Present',
      },
      {
        'Date': DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(Duration(days: 1))),
        'Time': DateFormat('kk:mm')
            .format(DateTime.now().subtract(Duration(days: 1))),
        'Check Status': 'Absent',
      },
      {
        'Date': DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(Duration(days: 2))),
        'Time': DateFormat('kk:mm')
            .format(DateTime.now().subtract(Duration(days: 2))),
        'Check Status': 'Present',
      },
      {
        'Date': DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(Duration(days: 3))),
        'Time': DateFormat('kk:mm')
            .format(DateTime.now().subtract(Duration(days: 3))),
        'Check Status': 'Absent',
      },
      // Add more dummy data as needed
    ]);
  }

  void checkIn() {
    setState(() {
      String checkInTime =
          DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
      attendanceData.add({
        'Date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'Time': DateFormat('kk:mm').format(DateTime.now()),
        'Check Status': 'Present',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: checkIn,
            child: Text('Check In'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('Check Status')),
                ],
                rows: List<DataRow>.generate(
                  attendanceData.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text(attendanceData[index]['Date'])),
                      DataCell(Text(attendanceData[index]['Time'])),
                      DataCell(
                        Text(
                          attendanceData[index]['Check Status'],
                          style: TextStyle(
                            color: attendanceData[index]['Check Status'] ==
                                    'Present'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Attendence()),
            );
          },
          child: Text('Go to Attendance'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Attendance App',
    home: HomePage(),
  ));
}
