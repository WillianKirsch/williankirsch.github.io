import 'package:flutter/material.dart';
import 'package:williankirsch/src/tools/base_page.dart';

class DeveloperPage extends StatefulWidget {
  const DeveloperPage({
    super.key,
  });

  @override
  State<DeveloperPage> createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BasePage(
        scaffoldKey: scaffoldKey,
        menuItems: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Mail',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          NavigationDrawerDestination(
            label: Text('destination.label'),
            icon: Icon(Icons.widgets),
            selectedIcon: Icon(Icons.widgets),
          ),
          const Divider(indent: 28, endIndent: 28),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Labels',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          NavigationDrawerDestination(
            label: Text('destination.label'),
            icon: Icon(Icons.widgets),
            selectedIcon: Icon(Icons.widgets),
          ),
        ],
        selectedBody: createScreenFor);
  }

  Widget createScreenFor(int screenIndex) {
    switch (screenIndex) {
      case 0:
        return const Page1();
      case 1:
        return const Page2();
      case 2:
        return const Page3();
    }
    return const Page3();
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text('Page1'),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Page2');
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Page3');
  }
}
