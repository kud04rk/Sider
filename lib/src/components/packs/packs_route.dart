import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sider/src/utils/extensions.dart';

import '../../constants/strings.dart';
import '../../styles/colors.dart';
import '../core/loading_text.dart';
import '../core/scrollable_template.dart';
import 'bottom_bar.dart';
import 'choice.dart';

class PacksRoute extends StatelessWidget {
  const PacksRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageColor,
      body: ScrollableTemplate(
        showBackButton: true,
        title: AppStrings.packsRouteTitle,
        children: <Widget>[
          FutureBuilder(
            future: loadPacks(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData)
                return LoadingText(text: "Loading packs ...").sliver();
              else
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Choice(pack: snapshot.data[index]);
                    },
                    childCount: snapshot.data.length,
                  ),
                );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
