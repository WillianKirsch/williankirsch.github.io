import 'package:flutter/material.dart';
import 'package:purple_ds/purple_design_system.dart';
import 'package:turttle/core.dart';
import 'package:turttle/settings.dart';

/// The Widget that configures your application.
class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
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
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: settingsController.themeMode,
          routerConfig: Modular.routerConfig,
        );
      },
    );
  }
}
