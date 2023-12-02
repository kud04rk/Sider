import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../../styles/text_styles.dart';


class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // un comment to show logo
        Image.asset(
          'icons/android.png',
          scale: 7.5,
        ),

        // App name (Shots)
        Text(
          AppStrings.appTitle,
          style: TextStyles.title,
        ),
      ],
    );
  }
}
