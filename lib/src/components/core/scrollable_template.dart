import 'package:flutter/material.dart';
import 'package:sider/src/components/core/spacing.dart';
import 'package:sider/src/components/core/title_text.dart';
import 'package:sider/src/utils/extensions.dart';

import '../../styles/colors.dart';
import '../../styles/values.dart';
import 'buttons/close_button.dart';


class ScrollableTemplate extends StatelessWidget {
  final List<Widget> children;
  final bool showBackButton;
  final String? title;

  const ScrollableTemplate({super.key, required this.children, this.showBackButton = false, this.title});

  @override
  Widget build(BuildContext context) {
    // un comment if we want use this as a safe area for notch/rounded corners
    // double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      color: AppColors.pageColor,
      padding: EdgeInsets.symmetric(horizontal: Values.mainPadding),
      child: CustomScrollView(slivers: <Widget>[
        if (showBackButton)
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Spacing(height: Values.mainPadding),
                const AppCloseButton(),
              ]).sliver(),

        // some spacing so the content doesn't touch the top of the screen
        Spacing(height: Values.mainPadding).sliver(),

        // un comment if required
        // padding for status bar; we still want content to be able to scroll and be seen behind it
        // Spacing(height: statusBarHeight).sliver(),

        if (title != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(text: title!),
              Spacing(height: Values.mainPadding),
            ],
          ).sliver(),

        ...children,
      ]),
    );
  }

  // shortcut for wrapping widget in scaffold
  Widget scaffold() => Scaffold(body: this);
}
