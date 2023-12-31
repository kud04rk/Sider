import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants/hive_strings.dart';


class SettingsProvider extends ChangeNotifier {
  late bool nsfw;
  late bool acceptTerms;
  late bool highPerformanceAnimation;

  loadSettings() {
    print("Loading settings ...");
    final settingsBox = Hive.box(HiveBoxes.settings);
    nsfw = settingsBox.get(SettingsBox.nsfw, defaultValue: true);

    // if iphone, default for [highPerformanceAnimation] should be true
    bool defaultValue = true;
    highPerformanceAnimation =
        settingsBox.get(SettingsBox.highPerformanceAnimation, defaultValue: defaultValue);


    acceptTerms =
        settingsBox.get(SettingsBox.acceptTerms, defaultValue: false);
  }


}

class SettingsService {
  static var _settingsBox = Hive.box(HiveBoxes.settings);

  // todo: refactor these functions and shorten them
  static enableNsfw() {
    _settingsBox.put(SettingsBox.nsfw, true);
  }

  static acceptTerms() {
    _settingsBox.put(SettingsBox.acceptTerms, true);
  }

  static disableNsfw() {
    _settingsBox.put(SettingsBox.nsfw, false);
  }

  static enableHighPerformanceAnimations() {
    _settingsBox.put(SettingsBox.highPerformanceAnimation, true);
  }

  static disableHighPerformanceAnimations() {
    _settingsBox.put(SettingsBox.highPerformanceAnimation, false);
  }
}
