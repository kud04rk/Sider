import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:sider/src/styles/colors.dart';
import 'package:sider/src/styles/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sider/src/utils/bounce_scroll.dart';
import 'constants/hive_strings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // black android navbar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.pageColor,
      statusBarColor: Colors.transparent,
    ));
    // make it a full screen app
    // but show Android navbar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom, // Show the navigation bar
    ]);
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    return ValueListenableBuilder(
      // listen
      valueListenable: Hive.box(HiveBoxes.settings).listenable(),
      builder: (context, box, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          builder: (BuildContext context, Widget widget) {
            // load settings
            final settingsProvider =
            Provider.of<SettingsProvider>(context, listen: false);
            settingsProvider.loadSettings();
            print("build app");

            return ScrollConfiguration(
              behavior: BounceScrollBehavior(),
              child: ExtendedNavigator<Router>(router: Router()),
            );
            // return  ExtendedNavigator<Router>(router: Router());
          },
        );
      },
    );

  }
}
