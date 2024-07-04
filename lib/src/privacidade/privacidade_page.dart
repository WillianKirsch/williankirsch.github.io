import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

/// Displays a list of SampleItems.
class PrivacidadePage extends StatefulWidget {
  const PrivacidadePage({
    super.key,
  });

  static const routeName = 'privacidade';

  @override
  State<PrivacidadePage> createState() => _PrivacidadePageState();
}

class _PrivacidadePageState extends State<PrivacidadePage> {
  String? privacidade;

  void loadAsset(BuildContext context) {
    DefaultAssetBundle.of(context)
        .loadString('assets/privacidade.md')
        .then((value) => setState(() {
              privacidade = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    if (privacidade == null) {
      loadAsset(context);
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: privacidade == null
            ? const SizedBox.shrink()
            : Markdown(
                data: privacidade!,
                styleSheet: MarkdownStyleSheet(
                  h1: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  h2: const TextStyle(fontSize: 20),
                  a: const TextStyle(color: Colors.blue),
                ),
              ),
      ),
    );
  }
}
