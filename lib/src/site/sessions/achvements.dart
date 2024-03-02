import 'package:flutter/material.dart';
import 'package:williankirsch/src/core/core.dart';

import '../widgets/certificates_card.dart';
import 'widgets/scaffold_session.dart';

class Achvements extends StatelessWidget {
  const Achvements({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final double cardWidth = width < 1200 ? width * 0.75 : width * 0.28;
    final double cardHeight = width < 1200 ? height * 0.30 : height * 0.30;

    return ScaffoldSession(
      title: 'Certificados',
      color: Theme.of(context).colorScheme.primaryContainer,
      body: Column(
        children: [
          Flex(
            direction: width < 1200 ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CertificatesCard(
                cardWidth: cardWidth,
                cardHeight: cardHeight,
                backImage: myCertificatesBanner[0],
                projectTitle: myCertificatesTitles[0],
                projectDescription: myCertificatesDescriptions[0],
                projectLink: myCertificatesLinks[0],
                bottomWidget: Container(),
              ),
              SizedBox(
                width: width * 0.02,
                height: height * 0.02,
              ),
              CertificatesCard(
                cardWidth: cardWidth,
                cardHeight: cardHeight,
                backImage: myCertificatesBanner[1],
                projectTitle: myCertificatesTitles[1],
                projectDescription: myCertificatesDescriptions[1],
                projectLink: myCertificatesLinks[1],
                bottomWidget: Container(),
              ),
              SizedBox(
                width: width * 0.02,
                height: height * 0.02,
              ),
              CertificatesCard(
                cardWidth: cardWidth,
                cardHeight: cardHeight,
                backImage: myCertificatesBanner[2],
                projectTitle: myCertificatesTitles[2],
                projectDescription: myCertificatesDescriptions[2],
                projectLink: myCertificatesLinks[2],
                bottomWidget: Container(),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          ElevatedButton(
            onPressed: () {
              goToUrl(
                  'https://drive.google.com/drive/folders/0BzzA1Bzcgvz9NUoxbzNpQ21Kblk?resourcekey=0-u_bby4CvUvFFCIfs3w09fg&usp=sharing');
            },
            child: const Text(
              'Veja mais',
            ),
          ),
        ],
      ),
    );
  }
}
