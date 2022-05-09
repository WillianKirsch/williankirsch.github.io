import 'package:flutter/material.dart';
import 'package:williankirsch/src/core/core.dart';

import '../widgets/portfolio_card.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double _cardWidth = width < 1200 ? width * 0.75 : width * 0.3;
    double _cardHeight = width < 1200 ? height * 0.28 : height * 0.25;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(
        children: [
          Text(
            "Contato",
            style: TextStyle(
              fontSize: height * 0.06,
              fontWeight: FontWeight.w100,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Flex(
            direction: width < 1200 ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PortfolioCard(
                cardWidth: _cardWidth,
                cardHeight: _cardHeight,
                projectIconData: myContactIcons[0],
                projectTitle: myContactTitles[0],
                projectDescription: myContactDetails[0],
              ),
              SizedBox(
                width: width * 0.02,
                height: height * 0.02,
              ),
              PortfolioCard(
                cardWidth: _cardWidth,
                cardHeight: _cardHeight,
                projectIconData: myContactIcons[1],
                projectTitle: myContactTitles[1],
                projectDescription: myContactDetails[1],
              ),
              SizedBox(
                width: width * 0.02,
                height: height * 0.02,
              ),
              PortfolioCard(
                cardWidth: _cardWidth,
                cardHeight: _cardHeight,
                projectIconData: myContactIcons[2],
                projectTitle: myContactTitles[2],
                projectDescription: myContactDetails[2],
              ),
            ],
          )
        ],
      ),
    );
  }
}
