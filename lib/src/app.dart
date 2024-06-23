import 'package:flutter/material.dart';
import 'package:material_3_purple/home.dart';
import 'package:turttle/core.dart';
import 'package:turttle/pages.dart';
import 'package:turttle/settings.dart';
import 'package:williankirsch/src/sample_feature/sample_item.dart';
import 'package:williankirsch/src/tools/tools_home_page.dart';

import 'privacidade/privacidade_page.dart';
import 'sample_feature/sample_item_details_page.dart';
import 'sample_feature/sample_item_list_page.dart';
import 'site/single_page.dart';

/// The Widget that configures your application.
class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              SinglePage(settingsController: settingsController),
          routes: [
            GoRoute(
                path: 'ds',
                builder: (BuildContext context, GoRouterState state) =>
                    HomeDesignSystemPage(
                        settingsController: settingsController)),
          ],
        ),
        GoRoute(
            path: '/${ToolsHomePage.routeName}',
            builder: (BuildContext context, GoRouterState state) =>
                const ToolsHomePage()),
        GoRoute(
            path: '/${SampleItemListPage.routeName}',
            builder: (BuildContext context, GoRouterState state) =>
                const SampleItemListPage(),
            routes: [
              GoRoute(
                  path: SampleItemDetailsPage.routeName,
                  redirect: (BuildContext context, GoRouterState state) {
                    final item = state.extra as SampleItem?;
                    if (item == null) {
                      return '/';
                    } else {
                      return null;
                    }
                  },
                  builder: (BuildContext context, GoRouterState state) {
                    final item = state.extra as SampleItem;

                    return SampleItemDetailsPage(item: item);
                  }),
            ]),
        GoRoute(
            path: '/${PrivacidadePage.routeName}',
            builder: (BuildContext context, GoRouterState state) =>
                const PrivacidadePage()),
        GoRoute(
          path: '/${SettingsPage.routeName}',
          builder: (BuildContext context, GoRouterState state) => SettingsPage(
            settingsController: settingsController,
            widgets: [
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/ds');
                },
                child: const Text('Design System'),
              ),
            ],
          ),
        ),
      ],
    );

    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          title: 'Willian Kirsch',
          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: settingsController.themeDataLight,
          darkTheme: settingsController.themeDataDark,
          themeMode: settingsController.themeMode,
          routerConfig: router,
        );
      },
    );
  }
}
