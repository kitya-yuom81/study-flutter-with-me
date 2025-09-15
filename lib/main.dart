import 'package:flutter/material.dart';
import 'simple_task.dart'; // import your widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleTask(), // use widget from another file
    );
  }
}
