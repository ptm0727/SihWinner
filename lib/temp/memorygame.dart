import 'dart:ffi';

import 'package:flutter/material.dart';

int points = 0;
int counter = 1;
bool start = true;

class Game2 extends StatefulWidget {
  const Game2({Key? key}) : super(key: key);

  @override
  State<Game2> createState() => _MemoryGameState();
}

class _MemoryGameState extends State<Game2> {
  @override
  int n = 30;
  List<GameTile> gameMatrix = [];

  void getListofNums() {
    List<int> Button_ids = [];
    for (int i = 1; i <= n; i++) {
      Button_ids.add(i);
    }
    Button_ids.shuffle();
    for (int i = 0; i < n; i++) {
      gameMatrix.add(
        GameTile(
          id: Button_ids[i],
          onPressed: () {
            if (counter == Button_ids[i]) {
              setState(() {
                points = points + 20;
                counter++;
              });
              print("pressed the right button");
              print(counter);
            }
          },
        ),
      );
    }
  }

  Widget game() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 5,
            shrinkWrap: true,
            children: gameMatrix,
          )
        ],
      ),
    );
  }

  void initState() {
    getListofNums();
    counter = 1;
    points = 0;
  }

  bool start = false;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Test Your Speed",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "$points/600",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                "Points",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              Text(
                "Hit the Rabbit",
                style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
              Center(child: game()),
            ]));
  }
}

class GameTile extends StatefulWidget {
  int id;
  late Function() onPressed;
  GameTile({required this.id, required this.onPressed});
  @override
  State<GameTile> createState() => _GameTileState();
}

class _GameTileState extends State<GameTile> {
  bool selected = true;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 20), () {
      setState(() {
        start = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            widget.onPressed();
            selected = true;
          });
        },
        child: counter == widget.id
            ? Container(
                margin: const EdgeInsets.all(5),
                child: Image.asset("assets/rabbit.png"),
              )
            : Container(
                margin: const EdgeInsets.all(5),
                child: Image.asset("assets/panda.png"),
              ));
  }
}
