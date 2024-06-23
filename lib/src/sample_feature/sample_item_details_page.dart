import 'package:flutter/material.dart';

import 'sample_item.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsPage extends StatelessWidget {
  const SampleItemDetailsPage({
    super.key,
    required this.item,
  });

  final SampleItem item;

  static const routeName = 'sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details: ${item.id}'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
