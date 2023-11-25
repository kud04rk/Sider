import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../constants/strings.dart';
import '../../providers/packs_provider.dart';
import '../../services/game_service.dart';
import '../../styles/colors.dart';
import '../../styles/values.dart';
import '../core/buttons/button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Needs to listen for state changes for (un)select all button
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: true);

    bool everythingSelected = packsProvider.unSelectedPacks.isEmpty;

    // true if no packs selected
    bool disableButton = packsProvider.selectedPacks.isEmpty;

    return SafeArea(
      // for phones such as iPhone X with rounded bottom corners
      bottom: true,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Values.mainPadding,
          vertical: Values.mainPadding / 2,
        ),
        decoration: BoxDecoration(
          color: AppColors.pageColor,
          border: Border(top: BorderSide(width: 1, color: AppColors.pageBorderColor)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Button(
              text: everythingSelected ? AppStrings.unSelectAllButton : AppStrings.selectAllButton,
              color: everythingSelected ? AppColors.danger : AppColors.secondary,
              outline: true,

              // if everything is selected, button press should unselect all
              onTap: everythingSelected
                  ? () => packsProvider.unSelectAll()
                  : () => packsProvider.selectAll(),
            ),
            Button(
              text: AppStrings.doneButton,
              color: AppColors.accent,
              onTap: () => GameService.start(context),
              disabled: disableButton,
            ),
          ],
        ),
      ),
    );
  }
}
