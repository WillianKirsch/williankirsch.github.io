import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:purple_ds/purple_design_system.dart';
import 'package:turttle/core.dart';
import 'package:turttle/pages.dart';
import 'package:williankirsch/src/core/core.dart';
import 'package:williankirsch/src/site/widgets/social_media_icon.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
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
          SafeArea(
            child: Image.asset(
              'assets/images/background.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomRight,
            ),
          ),
          Positioned.fill(
            top: width < 1200 ? height * 0.46 : 0,
            right: width < 1200 ? 0 : width * 0.05,
            child: Align(
              alignment:
                  width < 1200 ? Alignment.center : Alignment.bottomRight,
              child: Image.asset(Images.profile, height: height * 0.90),
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
                    GestureDetector(
                      onLongPress: () => GoRouter.of(context)
                          .push('/${SettingsPage.routeName}'),
                      child: Image.asset(
                        'assets/images/hi.gif',
                        height: height * 0.03,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  'Eu sou,',
                  style: TextStyle(
                    fontSize: height * 0.025,
                    fontWeight: FontWeight.w200,
                    color: PurpleColors.lightest,
                  ),
                ),
                Text(
                  'Willian',
                  style: TextStyle(
                    fontSize: height * 0.055,
                    fontWeight: FontWeight.w500,
                    color: PurpleColors.lightest,
                  ),
                ),
                Text(
                  'Kirsch',
                  style: TextStyle(
                    fontSize: height * 0.055,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.1,
                    color: PurpleColors.lightest,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize:
                            width < 1200 ? height * 0.030 : height * 0.040,
                        fontWeight: FontWeight.w100,
                        color: PurpleColors.lightest,
                      ),
                      child: AnimatedTextKit(
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          animatedTexts: [
                            TyperAnimatedText('Líder de equipe'),
                            TyperAnimatedText('Cientista da Computação'),
                            TyperAnimatedText('Empreendedor'),
                            TyperAnimatedText('Engenheiro de Software'),
                            TyperAnimatedText('Professor'),
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
