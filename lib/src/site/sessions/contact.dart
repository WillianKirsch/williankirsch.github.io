import 'package:flutter/material.dart';
import 'package:williankirsch/src/core/core.dart';

import '../widgets/portfolio_card.dart';
import 'widgets/scaffold_session.dart';

class Contact extends StatelessWidget {
  const Contact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final double cardWidth = width < 1200 ? width * 0.75 : width * 0.28;
    final double cardHeight = width < 1200 ? height * 0.25 : height * 0.30;

    return ScaffoldSession(
      title: 'Contato',
      body: Flex(
        direction: width < 1200 ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PortfolioCard(
            cardWidth: cardWidth,
            cardHeight: cardHeight,
            projectIconData: myContactIcons[0],
            projectTitle: myContactTitles[0],
            projectDescription: myContactDetails[0],
            projectLink: myContactLinks[0],
          ),
          SizedBox(
            width: width * 0.02,
            height: height * 0.02,
          ),
          PortfolioCard(
            cardWidth: cardWidth,
            cardHeight: cardHeight,
            projectIconData: myContactIcons[1],
            projectTitle: myContactTitles[1],
            projectDescription: myContactDetails[1],
            projectLink: myContactLinks[1],
          ),
          SizedBox(
            width: width * 0.02,
            height: height * 0.02,
          ),
          PortfolioCard(
            cardWidth: cardWidth,
            cardHeight: cardHeight,
            projectIconData: myContactIcons[2],
            projectTitle: myContactTitles[2],
            projectDescription: myContactDetails[2],
            projectLink: myContactLinks[2],
          ),
        ],
      ),
    );
  }
}
