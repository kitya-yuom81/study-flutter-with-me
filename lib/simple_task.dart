import 'package:flutter/material.dart';

class SimpleTask extends StatefulWidget {
  const SimpleTask({super.key});

  @override
  State<SimpleTask> createState() => _SimpleTaskState();
}

class _SimpleTaskState extends State<SimpleTask> {
  String message = "Hello Flutter 👋";

  void changeText() {
    setState(() {
      message = "You clicked me! 🚀";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Small Task")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeText,
              child: const Text("Click Me"),
            ),
          ],
        ),
      ),
    );
  }
}
