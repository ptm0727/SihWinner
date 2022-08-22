import 'package:flutter/material.dart';
import 'package:sih_brain_games/word_game/word_game_home.dart';

class Images extends StatelessWidget {
  String link;
  Images(this.link);
  String linking = 'assets/images_word_game/';

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      linking + link + '.jpg',
    );
  }
}
