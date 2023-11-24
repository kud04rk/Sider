

import 'package:auto_route/auto_route.dart';

import '../components/home/home_route.dart';
import '../components/packs/packs_route.dart';
import '../components/settings/settings_route.dart';
import '../components/terms/terms_route.dart';
import '../components/game/game_route.dart';

@AutoRouterConfig()
class $Router {
  late HomeRoute homeRoute;

  late PacksRoute packsRoute;


  late GameRoute gameRoute;

  late TermsRoute termsRoute;

  late SettingsRoute settingsRoute;
}
