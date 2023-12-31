import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../constants/strings.dart';
import '../../providers/settings_provider.dart';
import '../core/scrollable_template.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:sider/src/utils/extensions.dart';
import '../../styles/text_styles.dart';
import '../../styles/values.dart';
import 'on_off_toggle.dart';

class SettingsRoute extends StatefulWidget {
  const SettingsRoute({super.key});

  @override
  State<SettingsRoute> createState() => _SettingsRouteState();

}

class _SettingsRouteState extends State<SettingsRoute> {


  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider =
    Provider.of<SettingsProvider>(context, listen: false);

    return ScrollableTemplate(
      showBackButton: true,
      title: AppStrings.settingsRouteTitle,
      children: <Widget>[
        OnOffToggle(
          title: AppStrings.nsfw,
          enabled: settingsProvider.nsfw,
          onTap: () {
            SettingsProvider settingsProvider =
            Provider.of<SettingsProvider>(context, listen: false);
            if (settingsProvider.nsfw) {
              SettingsService.disableNsfw();
              setState(() {});

            } else {
              SettingsService.enableNsfw();
              setState(() {});
            }
          },
        ).sliver(),
        explanation(AppStrings.nsfwExplanation),

        // extra spacing required to differentiate sections
        SizedBox(height: Values.mainPadding * 2).sliver(),

        OnOffToggle(
          title: AppStrings.highPerformance,
          enabled: settingsProvider.highPerformanceAnimation,
          onTap: () {
            SettingsProvider settingsProvider =
            Provider.of<SettingsProvider>(context, listen: false);
            if (settingsProvider.highPerformanceAnimation) {
              SettingsService.disableHighPerformanceAnimations();
              setState(() {});
            } else {
              SettingsService.enableHighPerformanceAnimations();
              setState(() {});
            }
          },
        ).sliver(),
        explanation(AppStrings.performanceExplanation),

        // extra spacing required to differentiate sections
        SizedBox(height: Values.mainPadding * 2).sliver(),
      ],
    ).scaffold();
  }
  Widget explanation(String text) {
    return MarkdownBody(
      data: text,
      styleSheet: MarkdownStyleSheet(
        p: TextStyles.settingExplanation,
      ),
    ).sliver();
  }
}
