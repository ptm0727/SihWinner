import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:sih_brain_games/game1/game1.dart';
import 'package:sih_brain_games/games/memory_game_screen.dart';
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
        imgPath: "assets/game_images/Ani-Mate.jpg",
        destination: game1(),
        title: "Pair game",
        subtitle: "Identify pairs in the given grid",
      ),
      Button(
          imgPath: "assets/game_images/HopSCOTCH.jpg",
          destination: GameHome(),
          title: "Memory game",
          subtitle: "Click the numbers in the given order"),
      Button(
          imgPath: "assets/game_images/CP.jpg",
          destination: puz(),
          title: "Puzzle game",
      subtitle: "Save the human from the monsters",),
      Button(
          imgPath: "assets/game_images/H&S.jpg",
          destination: imspeed(),
          title: "Speed game",
        subtitle: "Hit the maximum Rabbits to score",),
      Button(
          imgPath: "assets/game_images/mATH.jpg",
          destination: mathgame(),
          title: "Math game",
        subtitle: "Test your math Skills here",),
      Button(
          imgPath: "assets/game_images/Word.jpg",
          destination: Word_game(),
          title: "Word game",
        subtitle: "Test you knowledge about the wild here",)
    ];
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Color(0xff6053BC),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "Games",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              // ListView.builder(
              //     physics: ClampingScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount: list.length,
              //     itemBuilder: (context, index) => list[index]),
              ...list
            ],
          ),
        ),
      ),
    );
  }
}
