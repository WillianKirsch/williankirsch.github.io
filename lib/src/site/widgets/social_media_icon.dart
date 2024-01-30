import 'package:flutter/material.dart';
import 'package:williankirsch/src/core/core.dart';

class SocialMediaIconBtn extends StatelessWidget {
  const SocialMediaIconBtn({
    super.key,
    required this.icon,
    required this.socialLink,
    required this.height,
    required this.horizontalPadding,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: IconButton(
        icon: Image.asset(
          icon,
          height: height,
        ),
        iconSize: height,
        onPressed: () => goToUrl(
          socialLink,
        ),
        hoverColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  final String icon;
  final String socialLink;
  final double height;
  final double horizontalPadding;
}
