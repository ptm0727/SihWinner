import 'package:sih_brain_games/games/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/games/memory_game_new.dart';

import '../rules_speed.dart';

class GameHome extends StatelessWidget {
  const GameHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey,
          elevation: 0,
          title: const Text(
            "Test your memory",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Rules(game: "hs")));
                },
                icon: Icon(
                  Icons.question_mark,
                  color: Colors.black,
                ))
          ],
        ),
        body: ChangeNotifierProvider<Counter>(
          create: (context) => Counter(),
          child: const MemoryGame1(),
        ));
  }
}
