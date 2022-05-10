import 'package:flutter/material.dart';
import 'package:williankirsch/src/core/core.dart';

class PortfolioCard extends StatefulWidget {
  const PortfolioCard({
    Key? key,
    this.projectIcon,
    required this.projectTitle,
    required this.projectDescription,
    this.projectLink,
    this.projectIconData,
    this.backImage,
    this.bottomWidget,
    this.cardWidth,
    this.cardHeight,
  }) : super(key: key);

  final String? projectIcon;
  final IconData? projectIconData;
  final String projectTitle;
  final String projectDescription;
  final String? projectLink;
  final double? cardWidth;
  final double? cardHeight;
  final String? backImage;
  final Widget? bottomWidget;

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<PortfolioCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.projectLink != null
          ? () => goToUrl(widget.projectLink!)
          : null,
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
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      color: Colors.blue.withAlpha(200),
                      blurRadius: 12.0,
                      offset: Offset(2.0, 3.0),
                    )
                  ]
                : []),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.projectIcon != null
                    ? Image.asset(
                        widget.projectIcon!,
                        height: height * 0.1,
                      )
                    : Container(),
                widget.projectIconData != null
                    ? Icon(
                        widget.projectIconData,
                        color: Colors.blue,
                        size: height * 0.1,
                      )
                    : Container(),
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
              duration: Duration(milliseconds: 400),
              opacity: isHover ? 0.0 : 1.0,
              child: FittedBox(
                fit: BoxFit.fill,
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
