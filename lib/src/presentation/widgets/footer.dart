import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, _height * 0.05, 0, 0),
      height: _height * 0.07,
      width: _width,
      color: Colors.grey[900],
      child: const Center(
        child: Text(
          'Criado por Willian Kirsch',
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}
