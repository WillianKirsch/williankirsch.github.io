import 'package:flutter/material.dart';
import 'package:williankirsch/src/core/core.dart';

class CertificatesCard extends StatefulWidget {
  const CertificatesCard({
    Key? key,
    this.backImage,
    this.bottomWidget,
    required this.projectTitle,
    required this.projectDescription,
    required this.projectLink,
    this.cardWidth,
    this.cardHeight,
  }) : super(key: key);

  final String projectTitle;
  final String projectDescription;
  final String projectLink;
  final double? cardWidth;
  final double? cardHeight;
  final String? backImage;
  final Widget? bottomWidget;

  @override
  State<CertificatesCard> createState() => _CertificatesCardState();
}

class _CertificatesCardState extends State<CertificatesCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => goToUrl(widget.projectLink),
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        width: widget.cardWidth,
        height: widget.cardHeight,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.onSecondary,
                      blurRadius: 12.0,
                      offset: const Offset(2.0, 3.0),
                    )
                  ]
                : []),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  widget.projectTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: height * 0.02,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  widget.projectDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: height * 0.015,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w100,
                      height: width >= 600 ? 2.0 : 1.5),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                widget.bottomWidget ?? Container(),
              ],
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isHover ? 0.0 : 1.0,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: widget.backImage != null
                    ? Image.asset(widget.backImage!)
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
