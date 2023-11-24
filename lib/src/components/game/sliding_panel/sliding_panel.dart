import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingPanel extends StatelessWidget {
  const SlidingPanel({
    Key? key,
    this.showSlidingPanel = false,
    this.panelController,
    required this.body,
  }) : super(key: key);
  final bool showSlidingPanel;
  final PanelController? panelController;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
