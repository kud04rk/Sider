import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sider/src/utils/extensions.dart';

import '../../models/pack_model.dart';
import '../../providers/packs_provider.dart';
import '../../services/sound_service.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
import '../../styles/values.dart';
import '../core/spacing.dart';

class Choice extends StatelessWidget {
  const Choice({super.key, required this.pack});
  final Pack pack;

  @override
  Widget build(BuildContext context) {
    // to check if pack is selected or unselected
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: true);
    bool selected = packsProvider.selectedPacks.contains(pack);

    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: Values.durationMs),
        margin: EdgeInsets.only(bottom: Values.mainPadding),
        padding: EdgeInsets.all(Values.mainPadding / 1.5),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(Values.borderRadius),
          border: Border.all(
            width: selected ? 2 : 1.4,
            color: selected ? AppColors.accent : AppColors.pageBorderColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // flex 1 resizes it to take the remaining space because the amount of space
                // the no of cards takes should not change
                Flexible(
                  flex: 1,
                  child: Text(
                    pack.name,
                    // if NSFW, make it red
                    style:
                    pack.nsfw ? TextStyles.packName.c(AppColors.danger) : TextStyles.packName,

                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // using expanded so that the cards display will always take the same width of space
                Expanded(
                  flex: 0,
                  child: Text(
                    "${pack.cards.length} cards",
                    style: TextStyles.body1.s(0.8 * Values.em),
                  ),
                )
              ],
            ),
            Spacing(height: Values.mainPadding / 2),
            Text(pack.description, style: TextStyles.packDescription),
          ],
        ),
      ),
      onTap: () {
        _selectOrUnselect(context);

        // play pop button sound
        SoundService.pop(secondary: true);
      },
    );
  }
  _selectOrUnselect(BuildContext context) {
    // check if selected
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: false);

    if (packsProvider.selectedPacks.contains(pack)) {
      // Already selected, need to unselect
      packsProvider.unSelect(pack);
    } else {
      // Need to select
      packsProvider.select(pack);
    }
  }
}
