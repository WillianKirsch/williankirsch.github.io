import 'package:flutter/material.dart';
import 'package:turttle/core.dart';
import 'package:turttle/settings.dart';
import 'package:williankirsch/src/privacidade/privacidade_page.dart';

import 'src/app.dart';
import 'src/sample_feature/sample_item_details_view.dart';
import 'src/sample_feature/sample_item_list_view.dart';

import 'src/settings/settings_service.dart';
import 'src/settings/settings_view.dart';
import 'src/site/single_page.dart';

void main() async {
  // configureApp();

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(
    settingsService: SettingsServiceImpl(),
    firebaseOptions: null,
    useMobAds: false,
  );

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(
    ModularApp(
      module: AppModule(
        settingsController: settingsController,
      ),
      child: AppWidget(
        settingsController: settingsController,
      ),
    ),
  );
  //runApp();
}

class AppModule extends Module {
  AppModule({required this.settingsController});

  final SettingsController settingsController;

  @override
  void binds(Injector i) => [];

  @override
  void routes(RouteManager r) => [
        r.child(SinglePage.routeName,
            child: (context) =>
                SinglePage(settingsController: settingsController)),
        r.child(SampleItemListView.routeName,
            child: (context) => const SampleItemListView()),
        r.child(PrivacidadePage.routeName,
            child: (context) => const PrivacidadePage()),
        r.child(SettingsView.routeName,
            child: (context) => SettingsView(controller: settingsController)),
        r.child(SampleItemDetailsView.routeName,
            child: (context) => const SampleItemDetailsView()),
      ];
}
