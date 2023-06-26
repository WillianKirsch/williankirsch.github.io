import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:williankirsch/src/privacidade/privacidade_page.dart';

import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'src/app.dart';
import 'src/sample_feature/sample_item_details_view.dart';
import 'src/sample_feature/sample_item_list_view.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/settings/settings_view.dart';
import 'src/site/single_page.dart';

void main() async {
  // configureApp();

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

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
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(SinglePage.routeName,
            child: (context, args) =>
                SinglePage(settingsController: settingsController)),
        ChildRoute(SampleItemListView.routeName,
            child: (context, args) => const SampleItemListView()),
        ChildRoute(PrivacidadePage.routeName,
            child: (context, args) => const PrivacidadePage()),
        ChildRoute(SettingsView.routeName,
            child: (context, args) =>
                SettingsView(controller: settingsController)),
        ChildRoute(SampleItemDetailsView.routeName,
            child: (context, args) => const SampleItemDetailsView()),
      ];
}
