

import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: GameRoute.page),
    AutoRoute(page: TermsRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: PacksRoute.page)
  ];
}
