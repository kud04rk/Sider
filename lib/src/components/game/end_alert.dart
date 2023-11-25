import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sider/src/utils/extensions.dart';

import '../../constants/strings.dart';
import '../../providers/game_provider.dart';
import '../../services/game_service.dart';
import '../../services/tutorial_service.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
import '../../styles/values.dart';
import '../core/buttons/button.dart';
import '../core/spacing.dart';


showEndDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.pageColor,
            // a bigger border radius looks better
            borderRadius: BorderRadius.circular(Values.borderRadius * 2),
            border: Border.all(
              width: 1,
              color: AppColors.pageBorderColor,
            ),
          ),
          padding: EdgeInsets.all(Values.mainPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                AppStrings.endDialogTitle,
                // make font size smaller
                style: TextStyles.title //
                    .s(1.5 * Values.em),
              ),

              // spacing to make it look cleaner
              Spacing(height: Values.mainPadding),

              // options (continue game and end game)
              Button(
                text: "Continue playing",
                color: AppColors.accent,
                onTap: () => _closeDialog(context),
              ),

              // spacing to make it look cleaner
              Spacing(height: Values.mainPadding / 2),

              Button(
                text: "End game",
                // outline: true,
                color: AppColors.danger,
                onTap: () => _endGame(context),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _closeDialog(BuildContext context) {
  Navigator.pop(context);
}

/// End game or tutorial
void _endGame(BuildContext context) {
  final gameProvider = Provider.of<GameProvider>(context, listen: false);
  if (gameProvider.isTutorial)
    TutorialService.endTutorial(context);
  else
    GameService.end(context);
}
