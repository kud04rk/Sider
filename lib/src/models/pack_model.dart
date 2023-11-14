
import 'card_model.dart';

class Pack {
  Pack({required this.name, required this.slug, required this.description, required this.nsfw, required this.cards});
  final String name, slug, description;
  final bool nsfw;
  final List<ShotCard> cards;
}
