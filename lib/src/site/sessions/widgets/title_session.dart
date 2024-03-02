import 'package:flutter/material.dart';

class TitleSession extends StatelessWidget {
  const TitleSession({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        bottom: height * 0.04,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: height * 0.055,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
