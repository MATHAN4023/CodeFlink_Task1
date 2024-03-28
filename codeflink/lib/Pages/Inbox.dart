import 'package:codeflink/Pages/HomePage.dart';
import 'package:flutter/material.dart';

import 'Memories.dart';
import 'MemoryContainer.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  DateTime? selectedDate;
  bool proceedClicked = false; // Flag to track if "Proceed" button clicked

  @override
  Widget build(BuildContext context) {
    bool proceedEnabled = selectedDate != null;

    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
        backgroundColor: Colors.purpleAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                labelText: 'Select Date',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              controller: TextEditingController(
                text: selectedDate != null
                    ? "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}"
                    : '',
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: proceedEnabled
                  ? () {
                      setState(() {
                        proceedClicked = true; // Set flag to true
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const Memories()),
                      // );
                    }
                  : null,
              child: Text('Proceed'),
            ),
          ),
          SizedBox(height: 20),
          if (proceedClicked) // Show memory list only if "Proceed" clicked
            Expanded(
              child: _buildMemoriesList(),
            ),
        ],
      ),
    );
  }

  Widget _buildMemoriesList() {
    return ListView(
      children: [
        MemoryContainer(
          username: 'Meenakshi Temple',
          text: 'One Of the Best Temple.',
          time: '10:30 AM',
          iconData: Icons.temple_hindu_outlined,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MemoryContainer1(),
              ),
            );
          },
        ),
        MemoryContainer(
          username: 'Vishald mall',
          text: 'One OF the Best Mall in Madurai.',
          time: '12:00 PM',
          iconData: Icons.location_city_sharp,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MemoryContainer1(),
              ),
            );
          },
        ),
        // Add more MemoryContainer widgets as needed
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
