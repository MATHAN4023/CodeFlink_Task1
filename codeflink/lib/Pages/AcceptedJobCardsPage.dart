import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(AcceptedJobCardsPage());
}

class AcceptedJobCardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accepted Job Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> jsonData = [
    '{"title": "Arangam Artisans", "subtitle": "Gandhipuram", "content": "11:29PM"}',
    '{"title": "Thamarai Textiles", "subtitle": "Gandhipuram", "content": "12:22PM"}',
    '{"title": "Vannam Variety Store", "subtitle": "thudiyalur", "content": "1:00PM"}',
    '{"title": "Kaaviyam Creations", "subtitle": "Gandhipuram", "content": "3:23PM"}',
    '{"title": "Ilamai Emporium", "subtitle": "thudiyalur", "content": "14:29PM"}',
    '{"title": "Oviyam Outfitters", "subtitle": "Gandhipuram", "content": "6:30PM"}',
    '{"title": "Thendral Traders", "subtitle": "thudiyalur", "content": "8:00PM"}',
    '{"title": "Kuyil Couturers", "subtitle": "Gandhipuram", "content": "11:29AM"}',
  ];

  List<String> filteredData = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredData = jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Accepted Job Cards'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'lib/Assets/Icon/LOGO.png',
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              TextField(
                controller: searchController,
                onChanged: (value) {
                  filterData(value);
                },
                decoration: InputDecoration(
                  labelText: 'Search Jobs',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: _buildCards(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCards() {
    List<Widget> cards = [];

    for (int i = 0; i < filteredData.length; i += 2) {
      if (i + 1 < filteredData.length) {
        cards.add(Row(
          children: [
            _buildCard(filteredData[i]),
            _buildCard(filteredData[i + 1]),
          ],
        ));
      } else {
        cards.add(Row(
          children: [
            _buildCard(filteredData[i]),
            SizedBox(width: 180),
          ],
        ));
      }
    }

    return cards;
  }

  Widget _buildCard(String jsonString) {
    final Map<String, dynamic> data = jsonDecode(jsonString);

    return Expanded(
      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['title'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(data['subtitle']),
              SizedBox(height: 10),
              Text(data['content']),
            ],
          ),
        ),
      ),
    );
  }

  void filterData(String query) {
    setState(() {
      filteredData = jsonData
          .where((element) =>
              element.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
