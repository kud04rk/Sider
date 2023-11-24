import 'package:flutter/cupertino.dart';

import '../../styles/text_styles.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyles.title,
      ),
    );
  }
}
