import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(DesigningJobCardsPage());
}

class DesigningJobCardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Designing Job cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Sample JSON data
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:true,
        leading: IconButton(icon:Icon(Icons.arrow_back), onPressed:()=>Navigator.pop(context)),
        title: Text('Designing Job cards'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('lib/Assets/Icon/LOGO.png'), // Replace 'your_image.png' with your image path
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _buildCards(),
        ),
      ),
    );
  }

  List<Widget> _buildCards() {
    List<Widget> cards = [];

    for (int i = 0; i < jsonData.length; i += 2) {
      if (i + 1 < jsonData.length) {
        cards.add(Row(
          children: [
            _buildCard(jsonData[i]),
            _buildCard(jsonData[i + 1]),
          ],
        ));
      } else {
        cards.add(Row(
          children: [
            _buildCard(jsonData[i]),
            SizedBox(width: 180), // Placeholder for the last row if there's only one card
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
}
