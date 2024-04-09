import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(AcceptedJobCardsPage());
}

class AcceptedJobCardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accecpted Job cards',
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
    '{"title": "Card 1", "subtitle": "Subtitle 1", "content": "Content 1"}',
    '{"title": "Card 2", "subtitle": "Subtitle 2", "content": "Content 2"}',
    '{"title": "Card 3", "subtitle": "Subtitle 3", "content": "Content 3"}',
    '{"title": "Card 4", "subtitle": "Subtitle 4", "content": "Content 4"}',
    '{"title": "Card 5", "subtitle": "Subtitle 5", "content": "Content 5"}',
    '{"title": "Card 6", "subtitle": "Subtitle 6", "content": "Content 6"}',
    '{"title": "Card 7", "subtitle": "Subtitle 7", "content": "Content 7"}',
    '{"title": "Card 8", "subtitle": "Subtitle 8", "content": "Content 8"}',
    '{"title": "Card 1", "subtitle": "Subtitle 1", "content": "Content 1"}',
    '{"title": "Card 2", "subtitle": "Subtitle 2", "content": "Content 2"}',
    '{"title": "Card 3", "subtitle": "Subtitle 3", "content": "Content 3"}',
    '{"title": "Card 4", "subtitle": "Subtitle 4", "content": "Content 4"}',
    '{"title": "Card 5", "subtitle": "Subtitle 5", "content": "Content 5"}',
    '{"title": "Card 6", "subtitle": "Subtitle 6", "content": "Content 6"}',
    '{"title": "Card 7", "subtitle": "Subtitle 7", "content": "Content 7"}',
    '{"title": "Card 8", "subtitle": "Subtitle 8", "content": "Content 8"}',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:true,
        leading: IconButton(icon:Icon(Icons.arrow_back), onPressed:()=>Navigator.pop(context)),
        title: Text('Accecpted Job cards'),
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
