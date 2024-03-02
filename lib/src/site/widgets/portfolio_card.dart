import 'package:flutter/material.dart';
import 'package:williankirsch/src/core/core.dart';

class PortfolioCard extends StatefulWidget {
  const PortfolioCard({
    super.key,
    this.projectIcon,
    required this.projectTitle,
    required this.projectDescription,
    this.projectLink,
    this.projectIconData,
    this.backImage,
    this.bottomWidget,
    this.cardWidth,
    this.cardHeight,
  });

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
  State<PortfolioCard> createState() => _ProjectCardState();
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
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.onPrimary,
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
                if (widget.projectIcon != null)
                  Image.asset(
                    widget.projectIcon!,
                    height: height * 0.1,
                  ),
                if (widget.projectIconData != null)
                  Icon(
                    widget.projectIconData,
                    color: Theme.of(context).colorScheme.primary,
                    size: height * 0.1,
                  ),
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
                      color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  widget.projectDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: height * 0.025,
                      letterSpacing: 2.0,
                      height: width >= 600 ? 2.0 : 1.5,
                      color: Theme.of(context).colorScheme.primary),
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
