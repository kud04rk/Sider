import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:sider/src/utils/extensions.dart';
import 'package:sider/src/components/core/scrollable_template.dart';

import '../../constants/strings.dart';


@RoutePage()
class TermsRoute extends StatelessWidget {
  const TermsRoute({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollableTemplate(
      showBackButton: true,
      title: AppStrings.termsRouteTitle,
      children: <Widget>[
        MarkdownBody(data: AppStrings.terms).sliver(),
      ],
    ).scaffold();
  }
}
