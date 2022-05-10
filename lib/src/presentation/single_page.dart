import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:williankirsch/src/core/constants.dart';

import 'navBarLogo.dart';
import 'sessions/about.dart';
import 'sessions/contact.dart';
import 'sessions/education.dart';
import 'sessions/home.dart';
import 'sessions/achvements.dart';

class SinglePage extends StatefulWidget {
  const SinglePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 25.0);
  final _itemScrollController = ItemScrollController();
  final _itemPositionListener = ItemPositionsListener.create();

  final List<String> _sectionsName = [
    "Início",
    "Sobre",
    "Educação",
    "Certificados",
    "Contato",
  ];

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.school,
    Icons.work,
    // Icons.emoji_events,
    Icons.phone,
  ];

  void _scroll(int position) {
    _itemScrollController.scrollTo(
      index: position,
      duration: Duration(seconds: 1),
    );
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return Home();
    } else if (i == 1) {
      return About();
    } else if (i == 2) {
      return Education();
    } else if (i == 3) {
      return Achvements();
    } else if (i == 4) {
      return Contact();
    }

    //else if (i == 3) {
    //   return Skills();
    // } else if (i == 4) {
    //   return Experience();
    // } else if (i == 5) {
    //   return Portfolio();
    // } else if (i == 6) {
    //   return Certificates();
    // } else if (i == 7) {
    //   return Contact();
    // } else if (i == 8) {
    //   return SizedBox(
    //     height: 40.0,
    //   );
    // } else if (i == 9) {
    //   return ArrowOnTop(
    //     onPressed: () => _scroll(0),
    //   );
    // } else if (i == 10) {
    //   return Footer();
    //}
    else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue[400],
      extendBodyBehindAppBar: true,
      appBar: width > 1000
          ? _appBarTabDesktop()
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
      drawer: MediaQuery.of(context).size.width < 1000 ? _appBarMobile() : null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: RawScrollbar(
          controller: _scrollController,
          thumbColor: Colors.blue,
          thickness: 5.0,
          child: ScrollablePositionedList.builder(
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionListener,
            itemCount: 11,
            itemBuilder: (context, index) {
              return sectionWidget(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _appBarActions(String childText, int index, IconData icon) {
    return MediaQuery.of(context).size.width > 1000
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: Colors.blue,
              onPressed: () => _scroll(index),
              child: Text(
                childText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                hoverColor: Colors.blue,
                onPressed: () => _scroll(index),
                child: Center(
                  child: ListTile(
                    leading: Icon(
                      icon,
                      color: Colors.white,
                    ),
                    title: Text(childText),
                  ),
                )),
          );
  }

  PreferredSizeWidget _appBarTabDesktop() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: MediaQuery.of(context).size.width < 740
          ? const NavBarLogo()
          : NavBarLogo(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
      actions: [
        for (int i = 0; i < _sectionsName.length; i++)
          _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: Colors.blue,
            hoverColor: Colors.white.withAlpha(150),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: _getResume,
            child: Text(
              "Currículo",
              style: TextStyle(
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _getResume() async {
    await launchUrl(
      resume,
      mode: LaunchMode.inAppWebView,
    );
  }

  Widget _appBarMobile() {
    return Drawer(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: NavBarLogo(
                  height: 28,
                ),
              ),
              for (int i = 0; i < _sectionsName.length; i++)
                _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  hoverColor: Colors.blue.withAlpha(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.blue)),
                  onPressed: _getResume,
                  child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Currículo",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
