import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:williankirsch/core/core.dart';

class SocialMediaIconBtn extends StatelessWidget {
  final String icon;
  final String socialLink;
  final double height;
  final double horizontalPadding;

  const SocialMediaIconBtn({
    Key? key,
    required this.icon,
    required this.socialLink,
    required this.height,
    required this.horizontalPadding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: IconButton(
        icon: Image.network(
          icon,
        ),
        iconSize: height,
        onPressed: () => goToUrl(
          socialLink,
        ),
        hoverColor: Colors.blue,
      ),
    );
  }
}