import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sider/src/utils/extensions.dart';

import '../../constants/strings.dart';
import '../../models/pack_model.dart';
import '../../providers/packs_provider.dart';
import '../../providers/settings_provider.dart';
import '../../services/pack_service.dart';
import '../../styles/colors.dart';
import '../core/loading_text.dart';
import '../core/scrollable_template.dart';
import 'bottom_bar.dart';
import 'choice.dart';


@RoutePage()
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
              if (!snapshot.hasData) {
                return const LoadingText(text: "Loading packs ...").sliver();
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Choice(pack: snapshot.data[index]);
                    },
                    childCount: snapshot.data.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  /// Loading all packs so that they can be displayed.
  /// When all the packs are being loaded, all cards are also loaded
  Future<List<Pack>> loadPacks(BuildContext context) async {
    // Loading all packs from metadata.yml
    List<Pack> packs = await PackService.loadPacks();

    // remove nsfw packs if nsfw setting is off
    final settingsProvider = Provider.of<SettingsProvider>(context, listen: false);
    if (!settingsProvider.nsfw) {
      // set list to only have cards where nsfw is false
      packs = packs.where((eachPack) => eachPack.nsfw == false).toList();
    }

    // all these packs go into the unselected packs yaml
    // they will be manually selected by the user
    final packsProvider = Provider.of<PacksProvider>(context, listen: false);
    packsProvider.loadPacks(packs);

    // un comment below to test the loading indicator widget
    // await Future.delayed(Duration(seconds: 10));

    return packs;
  }
}
