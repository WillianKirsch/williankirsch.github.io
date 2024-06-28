import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:turttle/core.dart';
import 'package:williankirsch/src/privacidade/privacidade_page.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      height: height * 0.07,
      width: width,
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const Center(
            child: Text(
              'Criado por Willian Kirsch',
              style: TextStyle(fontWeight: FontWeight.w100),
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Termos de Uso',
                  style: const TextStyle(
                    color: Color(0xFFFFF7ED),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFFFFFFF),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      GoRouter.of(context).go('/${PrivacidadePage.routeName}');
                    },
                ),
                const TextSpan(
                  text: ' e ',
                  style: TextStyle(
                    color: Color(0xFFFFF7ED),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Política de Privacidade.',
                  style: const TextStyle(
                    color: Color(0xFFFFF7ED),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFFFFFFF),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      GoRouter.of(context).go('/${PrivacidadePage.routeName}');
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
