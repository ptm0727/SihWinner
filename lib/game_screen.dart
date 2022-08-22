import 'package:flutter/material.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:sih_brain_games/game1/game1.dart';
import 'package:sih_brain_games/games/memory_game_new.dart';
import 'package:sih_brain_games/math_game/maths_game_home.dart';
import 'package:sih_brain_games/puzzlegame/puzzle%20home.dart';
import 'package:sih_brain_games/speedgame/imspeed.dart';
import 'package:sih_brain_games/word_game/word_game_home.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Button(
        leading:
            "https://images.everydayhealth.com/images/cs-brain-games-to-boost-memory-722x406.jpg",
        destination: game1(),
        title: "Pair game",
        subtitle: "Identify pairs in the given grid",
      ),
      Button(destination: MemoryGame1(), title: "Memory game"),
      Button(destination: puz(), title: "Puzzle game"),
      Button(destination: imspeed(), title: "Speed game"),
      Button(destination: mathgame(), title: "Math game"),
      Button(destination: Word_game(), title: "Word game")
    ];
    return SingleChildScrollView(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) => list[index]),
    );
  }
}
