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
        title: "Ani-Mate",
        subtitle: "Improves memory and association skills",
      ),
      Button(
          imgPath: "assets/game_images/HopSCOTCH.jpg",
          destination: GameHome(),
          title: "Hopscotch",
          subtitle: "Improved memory and sequencing skills"),
      Button(
        imgPath: "assets/game_images/CP.jpg",
        destination: puz(),
        title: "Chor Sipahi",
        subtitle: "Hand-eye coordination and logical thinking ability",
      ),
      Button(
        imgPath: "assets/game_images/H&S.jpg",
        destination: imspeed(),
        title: "Luka Chhupi",
        subtitle: "Speed and hand-eye coordination",
      ),
      Button(
        imgPath: "assets/game_images/mATH.jpg",
        destination: mathgame(),
        title: "Are you Ramanujan?",
        subtitle: "Data analysis and logical thinking ability",
      ),
      Button(
        imgPath: "assets/game_images/Word.jpg",
        destination: Word_game(),
        title: "Guess Who?",
        subtitle: "Visual stimulation",
      )
    ];
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
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
