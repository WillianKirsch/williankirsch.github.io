import 'package:flutter/material.dart';

import 'developer/developer_page.dart';

enum ToolsType {
  dev,
  socialMedia,
  math,
  generators;
}

class ToolsHomePage extends StatefulWidget {
  const ToolsHomePage({
    super.key,
  });

  static const routeName = 'ferramentas';

  @override
  State<ToolsHomePage> createState() => _ToolsHomePageState();
}

class _ToolsHomePageState extends State<ToolsHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ToolsType toolsTypeView = ToolsType.dev;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SegmentedButton<ToolsType>(
          segments: const <ButtonSegment<ToolsType>>[
            ButtonSegment<ToolsType>(
                value: ToolsType.dev,
                label: Text('Devs'),
                icon: Icon(Icons.all_inclusive)),
            ButtonSegment<ToolsType>(
                value: ToolsType.socialMedia,
                label: Text('Social Media'),
                icon: Icon(Icons.phone_android)),
            ButtonSegment<ToolsType>(
                value: ToolsType.math,
                label: Text('Matemática'),
                icon: Icon(Icons.calculate)),
            ButtonSegment<ToolsType>(
                value: ToolsType.generators,
                label: Text('Geradores'),
                icon: Icon(Icons.calendar_view_month)),
          ],
          selected: <ToolsType>{toolsTypeView},
          onSelectionChanged: (Set<ToolsType> newSelection) {
            setState(() {
              // By default there is only a single segment that can be
              // selected at one time, so its value is always the first
              // item in the selected set.
              toolsTypeView = newSelection.first;
            });
          },
        ),
      ),
      body: Scaffold(
        key: scaffoldKey,
        body: createScreenFor(toolsTypeView),
      ),
    );
  }

  Widget createScreenFor(ToolsType screenSelected) {
    switch (screenSelected) {
      case ToolsType.dev:
        return const DeveloperPage();
      case ToolsType.socialMedia:
        return const Page3();
      case ToolsType.math:
        return const Page3();
      case ToolsType.generators:
        return const Page2();
    }
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
