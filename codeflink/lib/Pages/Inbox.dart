import 'package:flutter/material.dart';

import 'Memories.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  DateTime? selectedDate;
  List<String> items = [
    "Item 1 - Date: 2024-03-01",
    "Item 2 - Date: 2024-03-05",
    "Item 3 - Date: 2024-03-10",
    // Add more items here
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void filterByDate(DateTime? selectedDate) {
    List<String> dateFilteredItems = [];
    if (selectedDate != null) {
      String formattedDate =
          "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
      for (String item in items) {
        if (item.contains(formattedDate)) {
          dateFilteredItems.add(item);
        }
      }
      setState(() {
        filteredItems = dateFilteredItems;
      });
    } else {
      setState(() {
        filteredItems = items;
      });
    }
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
      filterByDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool proceedEnabled = selectedDate != null;

    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            readOnly: true,
            onTap: () => _selectDate(context),
            decoration: InputDecoration(
              labelText: 'Select Date',
              prefixIcon: Icon(Icons.calendar_today),
            ),
            controller: TextEditingController(
              text: selectedDate != null
                  ? "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}"
                  : '',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: proceedEnabled
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Memories()),
                    );
                  }
                : null,
            child: Text('Proceed'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredItems[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
