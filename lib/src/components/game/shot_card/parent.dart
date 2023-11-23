import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../models/card_model.dart';
import '../../../providers/card_provider.dart';
import '../../../providers/settings_provider.dart';
import 'card_display.dart';

class ShotCardParent extends StatelessWidget {
  const ({super.key});
  final ShotCard shotCard;
  final List<Widget> nextCards;

  @override
  Widget build(BuildContext context) {
  // use SwipeableWidget or SwipeableWidgetSlide depending on performance
  // setting

  final settingsProvider = Provider.of<SettingsProvider>(context, listen: false);
  // print(settingsProvider.highPerformanceAnimation);

  final cardProvider = Provider.of<CardProvider>(context, listen: false);

  return settingsProvider.highPerformanceAnimation
  ? SwipeableWidget(
  child: CardDisplay(shotCard: shotCard),
  horizontalThreshold: 0.95,
  animationDuration: 500,
  onLeftSwipe: () => nextCard(context),
  onRightSwipe: () => nextCard(context),
  nextCards: nextCards,
  )
      : SwipeableWidgetSlide(
  key: ObjectKey(cardProvider.currentCardIndex),
  child: CardDisplay(shotCard: shotCard),
  onLeftSwipe: () => nextCard(context),
  onRightSwipe: () => nextCard(context),
  onTopSwipe: () => nextCard(context),
  onBottomSwipe: () => nextCard(context),
  // nextCards: nextCards,
  nextCards: nextCards,
  );
  }
}
