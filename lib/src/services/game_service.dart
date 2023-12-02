import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/card_model.dart';
import '../providers/card_provider.dart';
import '../providers/game_provider.dart';
import '../providers/packs_provider.dart';
import '../providers/stopwatch_provider.dart';
import '../router/router.gr.dart';


class GameService {
  /// Execute all functions required for the game to start
  static start(BuildContext context) {
    /*
    Few things to do:
    1. Load the cards (they are already in the packs)
    2. Set gamestarted to true in GameProvider
    3. Start the stopwatch
    */

    // Loading the cards
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: false);
    CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);

    List<ShotCard> cards = [];
    for (var eachPack in packsProvider.selectedPacks) {
      cards = [...cards, ...eachPack.cards];
    }
    cardProvider.loadCards(cards);

    // Setting game started to true
    GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);
    gameProvider.startGame();

    // Start the timer
    StopwatchProvider stopwatchProvider = Provider.of<StopwatchProvider>(context, listen: false);
    stopwatchProvider.start();

    // go to game routes to start game

    AutoRouter.of(context).push(const GameRoute());
  }

  /// Execute all functions required for the game to end
  static end(BuildContext context) {
    /*
    1. Empty the cards list
    2. Empty the packs list
    3. Stop the stopwatch
    4. Set gamestarted to false in GameProvider
    */

    // empty the cards list
    CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);
    cardProvider.endGame();

    // also need to empty the pacls
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: false);
    packsProvider.endGame();

    // Stop the staopwatch
    StopwatchProvider stopwatchProvider = Provider.of<StopwatchProvider>(context, listen: false);
    stopwatchProvider.stop();

    // Setting game started to false
    GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);
    gameProvider.endGame();

    // go to game routes to home page
    // popping first time to go back to pack selection screen
    // second time to go to main screen
    // AutoRouter.of(context).popAndPush(const HomeRoute());
    context.router.popUntil((route) => route.settings.name == 'HomeRoute');
  }
}
