import 'package:flutter/cupertino.dart';

class TermsRoute extends StatelessWidget {
  const ({super.key});

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
