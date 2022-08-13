import 'package:flutter/material.dart';

class MemoryGame extends StatefulWidget {
  const MemoryGame({Key? key}) : super(key: key);

  @override
  State<MemoryGame> createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  @override
  int n = 9;
  int counter = 0;
  List<GameTile> gameMatrix = [];

  void getListofNums() {
    List<int> _nums_in_ques = [];
    for (int i = 1; i <= n; i++) {
      _nums_in_ques.add(i);
    }
    _nums_in_ques.shuffle();

    for (int i = 0; i < n; i++) {
      gameMatrix.add(GameTile(
          id: _nums_in_ques[i],
          onPressed: () {
            if (++counter != _nums_in_ques[i]) {
              counter = -10;
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Center(
                        child: Text(
                          "Game over",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),
                      actions: [
                        Center(
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  gameMatrix.clear();
                                  start = false;
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                "Play Again",
                                style: TextStyle(fontSize: 20),
                              )),
                        )
                      ],
                      actionsAlignment: MainAxisAlignment.center,
                    );
                  });
            } else if (counter == n) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Center(
                        child: Text(
                          "You won!!",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),
                      actions: [
                        Center(
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  gameMatrix.clear();
                                  start = false;
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                "Play Again",
                                style: TextStyle(fontSize: 20),
                              )),
                        )
                      ],
                      actionsAlignment: MainAxisAlignment.center,
                    );
                  });
            }
          }));
    }
  }

  void initState() {
    // getListofNums();
    counter = 0;
  }

  bool start = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test Your Memory",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // start
                  //     ? Expanded(
                  //         child: GridView.count(
                  //           crossAxisCount: 3,
                  //           children: gameMatrix,
                  //         ),
                  //       )
                  //     : Container(),
                  // !start
                  //     ? ElevatedButton(
                  //         onPressed: () {
                  //           setState(() {
                  //             start = true;
                  //             getListofNums();
                  //             counter = 0;
                  //           });
                  //         },
                  //         child: Text("Start Game",
                  //             style: TextStyle(color: Colors.white, fontSize: 20)))
                  //     : Container(),
                  AnimatedCrossFade(
                      firstChild: start
                          ? GridView.count(
                              crossAxisCount: 3,
                              children: gameMatrix,
                              shrinkWrap: true,
                            )
                          : Container(),
                      secondChild: !start
                          ? ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  start = true;
                                  getListofNums();
                                  counter = 0;
                                });
                              },
                              child: Text("Start Game",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)))
                          : Container(),
                      crossFadeState: start
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 400))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GameTile extends StatefulWidget {
  int id;
  late Function() onPressed;
  bool? gameOver;
  GameTile({required this.id, required this.onPressed, this.gameOver});

  @override
  State<GameTile> createState() => _GameTileState();
}

class _GameTileState extends State<GameTile> {
  bool selected = true;

  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.gameOver ??= false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              selected = true;
              widget.onPressed();
            });
          },
          child: Text(
            widget.id.toString(),
            style: TextStyle(
                color: selected || widget.gameOver!
                    ? Colors.black
                    : Colors.transparent,
                fontSize: 30),
          )),
    );
  }
}
