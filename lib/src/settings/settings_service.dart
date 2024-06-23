import 'package:flutter/material.dart';
import 'package:turttle/resources.dart';
import 'package:turttle/settings.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsServiceImpl implements SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  @override
  Future<ThemeMode> themeMode() async {
    final box = Hive.box(TurttleHiveBoxes.settings.name);

    var theme = box.get(TurttleHiveSettingKeys.themeMode.name);
    // box.clear();
    if (theme == null) {
      theme = ThemeMode.system;
      box.put(TurttleHiveSettingKeys.themeMode.name, theme.index);
      return theme;
    }
    return ThemeMode.values[theme];
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  @override
  Future updateThemeMode(ThemeMode theme) async {
    final box = Hive.box(TurttleHiveBoxes.settings.name);

    box.put(TurttleHiveSettingKeys.themeMode.name, theme.index);
  }

  @override
  Future hiveOpenBoxes() async {
    await Hive.openBox(TurttleHiveBoxes.settings.name);
  }

  @override
  Future<Color?> themeColorSeed() async {
    final box = Hive.box(TurttleHiveBoxes.settings.name);

    final themeColorSeed = box.get(TurttleHiveSettingKeys.themeColorSeed.name);

    return themeColorSeed == null ? null : Color(themeColorSeed);
  }

  @override
  Future updateColorSeed(Color? color) async {
    final box = Hive.box(TurttleHiveBoxes.settings.name);
    box.put(TurttleHiveSettingKeys.themeColorSeed.name, color?.value);
  }
}
