import 'package:flutter/material.dart';
import 'package:williankirsch/src/core/core.dart';

import '../widgets/certificates_card.dart';

class Achvements extends StatelessWidget {
  const Achvements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final double _cardWidth = width < 1200 ? width * 0.75 : width * 0.28;
    final double _cardHeight = width < 1200 ? height * 0.30 : height * 0.30;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      color: Colors.grey[900],
      child: Column(
        children: [
          Text(
            'Certificados',
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
              CertificatesCard(
                cardWidth: _cardWidth,
                cardHeight: _cardHeight,
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
                cardWidth: _cardWidth,
                cardHeight: _cardHeight,
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
                cardWidth: _cardWidth,
                cardHeight: _cardHeight,
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
          MaterialButton(
            hoverColor: Colors.blue.withAlpha(150),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(color: Colors.blue)),
            onPressed: () {
              goToUrl(
                  'https://drive.google.com/drive/folders/0BzzA1Bzcgvz9NUoxbzNpQ21Kblk?resourcekey=0-u_bby4CvUvFFCIfs3w09fg&usp=sharing');
            },
            child: const Text(
              'Veja mais',
              style: TextStyle(
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
