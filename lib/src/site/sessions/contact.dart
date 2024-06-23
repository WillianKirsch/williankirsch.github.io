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
          ...getContacts(cardWidth, cardHeight),
        ],
      ),
    );
  }

  List<Widget> getContacts(double cardWidth, double cardHeight) {
    final List<Widget> contacts = [];
    for (var i = 0; i < myContactIcons.length; i++) {
      contacts.add(
        PortfolioCard(
          cardWidth: cardWidth,
          cardHeight: cardHeight,
          projectIconData: myContactIcons[i],
          projectTitle: myContactTitles[i],
          projectDescription: myContactDetails[i],
          projectLink: myContactLinks[i],
        ),
      );

      if (i < myContactIcons.length) {
        contacts.add(SizedBox(
          width: cardWidth * 0.20,
          height: cardHeight * 0.20,
        ));
      }
    }
    return contacts;
  }
}
