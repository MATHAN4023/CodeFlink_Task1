import 'package:codeflink/Pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CodeFlink());
}

class CodeFlink extends StatefulWidget {
  const CodeFlink({super.key});

  @override
  State<CodeFlink> createState() => _CodeFlinkState();
}

class _CodeFlinkState extends State<CodeFlink> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
