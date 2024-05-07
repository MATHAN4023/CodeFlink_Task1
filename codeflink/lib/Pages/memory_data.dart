import 'package:flutter/material.dart';

class Memory {
  final String event;
  final String username;
  final String text;
  final String time;
  final IconData iconData;
  final String location;

  Memory({
    required this.event,
    required this.username,
    required this.text,
    required this.time,
    required this.iconData,
    required this.location,
  });
}

List<Memory> memories = [
  Memory(
    event: 'Meenakshi Temple',
    username: 'Mathan',
    text: 'One Of the Best Temple.',
    time: '10:30 AM',
    iconData: Icons.temple_hindu_outlined,
    location: 'Madurai',
  ),
  Memory(
    event: 'Vishal mall 1',
    username: 'Nithesh',
    text: 'One OF the Best Mall in Madurai.',
    time: '12:00 PM',
    iconData: Icons.location_city_sharp,
    location: 'Madurai',
  ),
  Memory(
    event: 'Vishal mall 2',
    username: 'Ramm',
    text: 'One OF the Best Mall in Madurai.',
    time: '12:00 PM',
    iconData: Icons.location_city_sharp,
    location: 'Madurai',
  ),
  Memory(
    event: 'Vishal mall 1',
    username: 'Ritcherd',
    text: 'One OF the Best Mall in Madurai.',
    time: '12:00 PM',
    iconData: Icons.location_city_sharp,
    location: 'Madurai',
  ),
];
