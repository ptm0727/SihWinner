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
        destination: game1(),
        title: "Pair game",
        subtitle: "Identify pairs in the given grid",
      ),
      Button(
          leading: "assets/brain.png",
          destination: MemoryGame1(),
          title: "Memory game"),
      Button(destination: puz(), title: "Puzzle game"),
      Button(destination: imspeed(), title: "Speed game"),
      Button(destination: mathgame(), title: "Math game"),
      Button(destination: Word_game(), title: "Word game")
    ];
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
            child: Divider(
              thickness: 2,
            ),
          ),
          const Center(
            child: Text(
              "Games",
              style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
            ),
          ),
          ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) => list[index]),
        ],
      ),
    );
  }
}
