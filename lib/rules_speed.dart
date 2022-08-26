import 'package:flutter/material.dart';
import 'package:sih_brain_games/custom_button.dart';

class Rules extends StatelessWidget {
  String game;

  Rules({
    required this.game,
  });
  Map<String, String> rules = {
    "am":
        "The animals (2 of the same kind) are randomly placed.\n Once they dissappear, find the each animal's pair",
    "hs":
        "The numbers (from 1 to 9) are randomly arranged.\nRemember them in 10 seconds and select the tiles in the same order",
    "cs":
        "The chor block (thief) has to escape from the police block by moving the police blocks. The exit is at bottom centre ",
    "lc":
        "In a group of pandas, there is an odd one out - a rabbit that is moving everywhere.\n Catch the rabbit ",
    "ayr": "Find the solution to the given mathematical question ",
    "gw":
        "Identify the animal in the given picture and choose the correct answer ",
  };
  Map<String, String> game_name = {
    "am": "Ani-Mate ",
    "hs": "Hopscotch ",
    "cs": "Chor-Sipahi ",
    "lc": "Luka Chhupi ",
    "ayr": "Are you Ramanujan? ",
    "gw": "Guess who? ",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: Text(
          game_name[game]!,
          style: const TextStyle(
              fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Center(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: const Color(0xff6053BC),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    "Rules",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 17.0, horizontal: 30),
                  child: Center(
                    child: Text(
                      rules[game]!,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                  child: ListTile(
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      title: const Center(
                        child: Text(
                          "Go back",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
