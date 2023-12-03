import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:sider/src/utils/extensions.dart';
import 'package:sider/src/components/core/scrollable_template.dart';

import '../../constants/hive_strings.dart';
import '../../constants/strings.dart';
import '../../providers/settings_provider.dart';
import '../../router/router.gr.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
import '../../styles/values.dart';
import '../core/buttons/button.dart';
import '../core/spacing.dart';


@RoutePage()
class TermsRoute extends StatelessWidget {
  const TermsRoute({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollableTemplate(
      showBackButton: true,
      title: AppStrings.termsRouteTitle,
      children: <Widget>[
      explanation(AppStrings.terms),
        SizedBox(height: Values.mainPadding * 2).sliver(),
        Button(
          text: AppStrings.acceptTerms,
          // outline: true,
          color: AppColors.greens[0],
          onTap: () {
              SettingsProvider settingsProvider =Provider.of<SettingsProvider>(context, listen: false);
              if (!settingsProvider.acceptTerms) {
                  SettingsService.acceptTerms();
                  AutoRouter.of(context).push(const HomeRoute());
                  }
            },
        ).sliver(),
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

