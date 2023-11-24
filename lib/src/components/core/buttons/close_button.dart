import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_route/auto_route.dart';
import '../../../services/sound_service.dart';
import '../../../styles/text_styles.dart';
import '../../../styles/values.dart';

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({super.key,
    this.iconData,
    this.color,
    this.overrideOnTap});

  final IconData? iconData;
  final Color? color;
  final Function? overrideOnTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100.0),
      child: Container(
        padding: EdgeInsets.all(Values.buttonVerticalPadding),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.3),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Icon(
          // by default, show the cross icon unless another one is specified
          iconData ?? FontAwesomeIcons.times,
          color: color ?? Colors.red,
          size: TextStyles.button.fontSize,
        ),
      ),
      onTap: () {
        // go to previous page
        if (overrideOnTap == null)
          ExtendedNavigator.ofRouter<Router>().pop();
        else
          overrideOnTap!();

        // play pop button sound
        SoundService.pop(secondary: true);
      },
    );
  }
}
