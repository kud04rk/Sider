import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:sider/src/utils/extensions.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
import '../../styles/values.dart';

class OnOffToggle extends StatelessWidget {
  const OnOffToggle({Key? key, required this.title, this.enabled =false, this.onTap})
      : super(key: key);
  final String title;
  final bool enabled;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: Values.mainPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Text(
                title,
                style: TextStyles.settings,
                overflow: TextOverflow.fade,
              ),
            ),
            Expanded(
              flex: 0,
              child: Row(
                children: <Widget>[
                  AnimatedContainer(
                    duration: Duration(milliseconds: Values.durationMs),
                    padding: _togglePadding(),
                    decoration: BoxDecoration(
                      border: _border(enabled),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Values.borderRadius),
                        bottomLeft: Radius.circular(Values.borderRadius),
                      ),
                    ),
                    child: Text(
                      "On",
                      style: TextStyles.togglebutton,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: Values.durationMs),
                    padding: _togglePadding(),
                    decoration: BoxDecoration(
                      border: _border(!enabled),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Values.borderRadius),
                        bottomRight: Radius.circular(Values.borderRadius),
                      ),
                    ),
                    child: Text(
                      "Off",
                      style: TextStyles.togglebutton,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  // Padding for "On" and "Off"
  EdgeInsets _togglePadding() => EdgeInsets.symmetric(
    horizontal: Values.mainPadding / 2,
    vertical: Values.mainPadding / 3,
  );

  // Border function (blue border for on if enabled, otherside blue for off)
  Border _border(enabled) => Border.all(
    color: enabled ? AppColors.accent : AppColors.pageBorderColor,
    width: enabled ? 2 : 1,
  );




}
