import 'package:flutter/cupertino.dart';
import 'package:sider/src/components/core/spacing.dart';

import '../../styles/text_styles.dart';
import '../../styles/values.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacing(height: Values.mainPadding),

        // title
        Text(title, style: TextStyles.sectionHeading),
        Spacing(height: Values.mainPadding / 1.5),
        ...children,
      ],
    );
  }
}
