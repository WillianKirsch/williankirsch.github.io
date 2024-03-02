import 'package:flutter/material.dart';
import 'package:purple_ds/purple_design_system.dart';
import 'package:purple_ds/purple_widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:turttle/core.dart';
import 'package:turttle/pages.dart';
import 'package:turttle/settings.dart';

import 'package:williankirsch/src/core/constants.dart';

import 'nav_bar_logo.dart';
import 'sessions/about.dart';
import 'sessions/achvements.dart';
import 'sessions/contact.dart';
import 'sessions/education.dart';
import 'sessions/home.dart';
import 'widgets/arrow_on_top.dart';
import 'widgets/footer.dart';

class SinglePage extends StatefulWidget {
  const SinglePage({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;
  static const routeName = '/';

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  final _itemScrollController = ItemScrollController();
  final _itemPositionListener = ItemPositionsListener.create();

  final List<String> _sectionsName = [
    'Início',
    'Sobre',
    'Educação',
    'Certificados',
    'Contato',
  ];

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.school,
    Icons.work,
    Icons.phone,
  ];

  void _scroll(int position) {
    _itemScrollController.scrollTo(
      index: position,
      duration: const Duration(milliseconds: 800),
    );
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return const Home();
    } else if (i == 1) {
      return const About();
    } else if (i == 2) {
      return Education();
    } else if (i == 3) {
      return const Achvements();
    } else if (i == 4) {
      return const Contact();
    } else if (i == 5) {
      return ArrowOnTop(
        onPressed: () => _scroll(0),
      );
    } else if (i == 6) {
      return const Footer();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: width > 1000
          ? _appBarTabDesktop()
          : AppBar(
              iconTheme: const IconThemeData(color: PurpleColors.lightest),
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0.0,
              actions: [
                BrightnessButton(
                  handleBrightnessChange: (bool value) {
                    widget.settingsController.updateThemeMode(
                        value ? ThemeMode.light : ThemeMode.dark);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    GoRouter.of(context).push(SettingsPage.routeName);
                  },
                ),
              ],
            ),
      drawer: MediaQuery.of(context).size.width < 1000 ? _appBarMobile() : null,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: ScrollablePositionedList.builder(
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionListener,
            itemCount: 6,
            itemBuilder: (context, index) {
              return SingleChildScrollView(child: sectionWidget(index));
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
              onPressed: () => _scroll(index),
              child: Text(
                childText,
                style: const TextStyle(color: PurpleColors.lightest),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () => _scroll(index),
              child: Center(
                child: ListTile(
                  leading: Icon(
                    icon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(
                    childText,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),
              ),
            ),
          );
  }

  PreferredSizeWidget _appBarTabDesktop() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return AppBar(
      elevation: 0.0,
      backgroundColor: Theme.of(context).primaryColor,
      title: width < 740
          ? NavBarLogo(
              height: height * 0.035,
            )
          : NavBarLogo(
              height: height * 0.055,
            ),
      actions: [
        for (int i = 0; i < _sectionsName.length; i++)
          _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
        FilledButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.secondary),
          ),
          onPressed: _getResume,
          child: Text(
            'Currículo',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SizedBox(
            width: 50,
            child: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              child: BrightnessButton(
                handleBrightnessChange: (bool value) {
                  widget.settingsController.updateThemeMode(
                      value ? ThemeMode.light : ThemeMode.dark);
                },
                showTooltipBelow: true,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 24,
        )
      ],
    );
  }

  Future<void> _getResume() async {
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
              const Center(
                child: NavBarLogo(
                  height: 28,
                ),
              ),
              for (int i = 0; i < _sectionsName.length; i++)
                _appBarActions(_sectionsName[i], i, _sectionsIcons[i]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Theme.of(context).colorScheme.secondary,
                  hoverColor: Theme.of(context).colorScheme.tertiary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary)),
                  onPressed: _getResume,
                  child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    title: Text(
                      'Currículo',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
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
