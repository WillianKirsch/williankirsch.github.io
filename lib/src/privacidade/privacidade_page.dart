import 'package:flutter/material.dart';

import '../models/privacidade_model.dart';

/// Displays a list of SampleItems.
class PrivacidadePage extends StatelessWidget {
  const PrivacidadePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/privacidade';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              PrivacidadeModel.titulo,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              PrivacidadeModel.texto,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 40),
            Text(
              PrivacidadeModel.terceirosTitulo,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              PrivacidadeModel.terceirosTexto,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
