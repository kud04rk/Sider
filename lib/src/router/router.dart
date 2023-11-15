

@MaterialAutoRouter()
class $Router {
  @initial
  @CupertinoRoute(fullscreenDialog: true)
  HomeRoute homeRoute;

  PacksRoute packsRoute;

  @CupertinoRoute(fullscreenDialog: true)
  GameRoute gameRoute;

  TermsRoute termsRoute;

  SettingsRoute settingsRoute;
}
