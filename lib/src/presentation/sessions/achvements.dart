import 'package:flutter/material.dart';
import 'package:williankirsch/src/core/core.dart';

import '../widgets/certificates_card.dart';

class Achvements extends StatelessWidget {
  const Achvements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      color: Colors.grey[900],
      child: Column(
        children: [
          Text(
            "Certificados",
            style: TextStyle(
              fontSize: height * 0.06,
              fontWeight: FontWeight.w100,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(
            height: width > 1200 ? height * 0.45 : width * 0.2,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return VerticalDivider(
                  color: Colors.transparent,
                  width: width * 0.015,
                );
              },
              itemBuilder: (context, index) {
                return CertificatesCard(
                  cardWidth: width < 1200 ? width * 0.25 : width * 0.35,
                  cardHeight: width < 1200 ? height * 0.28 : height * 0.1,
                  backImage: myCertificatesBanner[index],
                  projectTitle: myCertificatesTitles[index],
                  projectDescription: myCertificatesDescriptions[index],
                  projectLink: myCertificatesLinks[index],
                  bottomWidget: Container(),
                );
              },
              itemCount: 4,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          MaterialButton(
            hoverColor: Colors.blue.withAlpha(150),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.blue)),
            onPressed: () {
              goToUrl(
                  "https://drive.google.com/drive/folders/0BzzA1Bzcgvz9NUoxbzNpQ21Kblk?resourcekey=0-u_bby4CvUvFFCIfs3w09fg&usp=sharing");
            },
            child: Text(
              "Veja mais",
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
