import 'package:flutter/material.dart';

import 'title_session.dart';

class ScaffoldSession extends StatelessWidget {
  const ScaffoldSession({
    super.key,
    required this.title,
    required this.body,
    this.color,
  });

  final String title;
  final Widget body;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: color ?? Theme.of(context).colorScheme.background,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSession(title: title),
          body,
        ],
      ),
    );
  }
}
