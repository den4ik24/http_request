import 'package:flutter/material.dart';
import 'package:http_request/Screens/data_from_API.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DataFromAPI(),
    );
  }
}