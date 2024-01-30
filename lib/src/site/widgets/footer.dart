import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      height: height * 0.07,
      width: width,
      color: Theme.of(context).colorScheme.background,
      child: const Center(
        child: Text(
          'Criado por Willian Kirsch',
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}
