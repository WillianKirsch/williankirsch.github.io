import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    required this.scaffoldKey,
    required this.menuItems,
    required this.selectedBody,
    super.key,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<Widget> menuItems;
  final Function(int screenIndex) selectedBody;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      body: Row(
        children: <Widget>[
          NavigationDrawer(
              onDestinationSelected: (selectedIndex) {
                setState(() {
                  screenIndex = selectedIndex;
                });
              },
              selectedIndex: screenIndex,
              children: widget.menuItems),
          widget.selectedBody(screenIndex),
        ],
      ),
    );
  }
}
