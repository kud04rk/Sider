import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

import '../models/card_model.dart';
import '../models/pack_model.dart';

class PackService {
  static Future<List<Pack>> loadPacks() async {
    /*
    1. Read yml file metadata.yml and get a list of packs
    2. Read each file from packs/ to get the cards
    */

    // reading metadata.yml
    final fileContent = await rootBundle.loadString('assets/metadata.yml');
    final metadata = loadYaml(fileContent);

    List<Pack> packs = [];

    for (var packMap in metadata) {
      // load cards by reading their files

      // BUG: error in the loop sometimes ocurs. Cannot replroduce it

      print("Adding pack");
      try {
        final List<ShotCard> cards = await _loadCards(packMap['slug']);

        final newPack = Pack(
          name: packMap['name'],
          slug: packMap['slug'],
          description: packMap['description'],
          // If not explictly stated, they are not NSFW
          nsfw: packMap['nsfw'] ?? false,
          cards: cards,
        );

        packs.add(newPack);
      } catch (e) {
        // If there's a card pack listed in metadata.yml, but with no {pack}.yml file,
        // there will be a silent error so the app doesn't crash
      }
    }

    return packs;
  }

  /// [slug] is the filename (filename.yml)
  /// This function will not be called on its own; it is only supposed to be called
  /// from the [[loadPacks()]] function
  static Future<List<ShotCard>> _loadCards(String slug) async {
    /*
    1. Read filename and return list of cards
    */

    final fileContent = await rootBundle.loadString('assets/packs/$slug.yml');
    final YamlList yamlListCards = loadYaml(fileContent);

    List<ShotCard> cards = [];
    for (var cardMap in yamlListCards) {
      final newCard = ShotCard.fromJson(cardMap);
      cards.add(newCard);
    }

    return cards;
  }
}
