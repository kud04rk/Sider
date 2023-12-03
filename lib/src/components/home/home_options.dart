import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/strings.dart';
import '../../providers/settings_provider.dart';
import '../../router/router.gr.dart';
import '../../services/tutorial_service.dart';
import '../../styles/colors.dart';
import '../../styles/values.dart';
import '../core/buttons/button.dart';
import '../core/spacing.dart';


/// Contains buttons to start game, see terms, or tutorial
class HomeOptions extends StatelessWidget {
  const HomeOptions({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    SettingsProvider settingsProvider =
    Provider.of<SettingsProvider>(context, listen: false);
    if (settingsProvider.acceptTerms) {
      debugPrint("Settings loaded");
    } else {
          AutoRouter.of(context).push(const TermsRoute());
    }


    return Padding(
      padding: EdgeInsets.all(Values.mainPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // start button (takes to pack selection first)
          Button(
            text: AppStrings.startButton,
            color: AppColors.accent,
            width: 200.0,
            focus: true,
              onTap: () => AutoRouter.of(context).push(const PacksRoute()),
          ),

          // spacing to make it look cleaner
          Spacing(height: Values.mainPadding),

          Button(
            text: AppStrings.termsRouteTitle,
            // outline: true,
            color: AppColors.greens[0],
            onTap: () => AutoRouter.of(context).push(const TermsRoute()),
          ),

          // spacing to make it look cleaner
          Spacing(height: Values.mainPadding),

          Button(
            text: AppStrings.settingsRouteButton,
            // outline: true,
            color: AppColors.reds[0],
            onTap: () => AutoRouter.of(context).push(const SettingsRoute()),
          ),

          // spacing to make it look cleaner
          Spacing(height: Values.mainPadding),

          Button(
            text: AppStrings.tutorialButton,
            color: AppColors.oranges[0],
            // outline: true,
            onTap: () => TutorialService.startTutorial(context),
          ),
        ],
      ),
    );
  }
}
