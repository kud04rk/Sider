import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../models/card_model.dart';
import '../../../providers/card_provider.dart';
import 'card_display.dart';

class NextShotCard extends StatelessWidget {
  const NextShotCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    // listen true because this must update when nextCard() is called
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);
    int nextCardIndex = (cardProvider.currentCardIndex + index) as int;

    try {
      // this may not exist; if it doesnt, return an empty container because nothing
      // needs to be here
      ShotCard nextCard = cardProvider.cards[nextCardIndex];

      Widget _shotCard = CardDisplay(
        shotCard: nextCard,
      );

      // user should not be able to interact with this card
      return IgnorePointer(child: _shotCard);
    } catch (e) {
      return Container();
    }
  }
}
