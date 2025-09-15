import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(8, (i) => "Item #${i + 1}");
    return Scaffold(
      appBar: AppBar(title: const Text("Details Page")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, i) => ListTile(
          leading: const Icon(Icons.star_border),
          title: Text(items[i]),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Tapped ${items[i]}"))),
        ),
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemCount: items.length,
      ),
    );
  }
}
