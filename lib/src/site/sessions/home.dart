import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:williankirsch/src/core/core.dart';
import 'package:williankirsch/src/site/widgets/social_media_icon.dart';
import 'package:williankirsch/src/settings/settings_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Positioned.fill(
            top: width < 1200 ? height * 0.50 : height * 0.1,
            right: width < 1200 ? 0 : width * 0.05,
            child: Align(
              alignment: width < 1200 ? Alignment.center : Alignment.topRight,
              child: Image.asset(Images.profile, height: height * 0.65),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(width * 0.07, height * 0.12, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/hi.gif',
                      height: height * 0.03,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  'Eu sou,',
                  style: TextStyle(
                      fontSize: height * 0.025, fontWeight: FontWeight.w200),
                ),
                Text(
                  'Willian',
                  style: TextStyle(
                      fontSize: height * 0.055, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Kirsch',
                  style: TextStyle(
                      fontSize: height * 0.055,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 1.1),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.blue,
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          animatedTexts: [
                            TyperAnimatedText('Engenheiro de Software'),
                            TyperAnimatedText('Empreendedor'),
                            TyperAnimatedText('Cientista da Computação'),
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int posicao = 0;
                        posicao < socialIcons.length;
                        posicao++)
                      SocialMediaIconBtn(
                        icon: socialIcons[posicao],
                        socialLink: socialLinks[posicao],
                        height: height * 0.03,
                        horizontalPadding: 2.0,
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
