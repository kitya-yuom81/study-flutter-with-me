import 'package:flutter/material.dart';
import 'details_page.dart';
import 'utils.dart';

class SimpleTask extends StatefulWidget {
  const SimpleTask({super.key, required this.onToggleTheme, required this.mode});
  final VoidCallback onToggleTheme;
  final ThemeMode mode;

  @override
  State<SimpleTask> createState() => _SimpleTaskState();
}

class _SimpleTaskState extends State<SimpleTask> {
  String message = "Hello Flutter 👋";
  int counter = 0;
  Color bg = Colors.transparent;
  final controller = TextEditingController();

  void changeText() {
    setState(() => message = "You clicked me! 🚀");
  }

  void randomizeBg() {
    setState(() => bg = randomColor().withOpacity(0.25));
  }

  void inc() => setState(() => counter++);
  void reset() {
    setState(() {
      message = "Hello Flutter 👋";
      counter = 0;
      bg = Colors.transparent;
      controller.clear();
    });
    _toast("Reset done");
  }

  void _toast(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  void applyTextFromInput() {
    if (controller.text.trim().isEmpty) {
      _toast("Type something first");
      return;
    }
    setState(() => message = controller.text.trim());
    _toast("Message updated");
  }

  void showQuote() {
    setState(() => message = randomQuote());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.mode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini Pro Flutter"),
        actions: [
          IconButton(
            tooltip: "Random quote",
            onPressed: showQuote,
            icon: const Icon(Icons.format_quote),
          ),
          IconButton(
            tooltip: "Toggle theme",
            onPressed: widget.onToggleTheme,
            icon: Icon(isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: Container(
        color: bg,
        width: double.infinity,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(message, textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Counter: "),
                      Chip(label: Text("$counter")),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: "Type new message",
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => applyTextFromInput(),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      FilledButton(onPressed: changeText, child: const Text("Change Text")),
                      OutlinedButton(onPressed: randomizeBg, child: const Text("Random BG")),
                      FilledButton.tonal(onPressed: inc, child: const Text("+1")),
                      OutlinedButton(onPressed: applyTextFromInput, child: const Text("Apply Input")),
                      ElevatedButton.icon(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const DetailsPage()),
                        ),
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text("Go to Details"),
                      ),
                      TextButton(onPressed: reset, child: const Text("Reset")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          randomizeBg();
          inc();
          _toast("BG changed & counter +1");
        },
        icon: const Icon(Icons.flash_on),
        label: const Text("Quick Boost"),
      ),
    );
  }
}
