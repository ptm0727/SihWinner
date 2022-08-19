import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/speedgame/counter1.dart';
import 'GameTile.dart';
int p=0;
class imspeed extends StatefulWidget {
  const imspeed({Key? key}) : super(key: key);

  @override
  State<imspeed> createState() => _MemoryGame1State();
}

class _MemoryGame1State extends State<imspeed> {
  bool start=true;
  Timer? timer;
  int s=20;
  @override
  void initState() {
    grid=generateTiles();
    start = true;
    s=20;
    p=0;
    startTimer();
    Future.delayed(Duration(seconds: 20), () {
      setState(() {
        start=false;
      });
    });
  }
  void startTimer(){
    timer=Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        s--;
      });
    });
  }
  @override
  List<GameTile> grid = [];
  int _totalNumOfTiles = 30;
  List<int> _numbers = [];


  List<GameTile> generateTiles() {
    for(int i=1;i<=_totalNumOfTiles;i++)
      {
        _numbers.add(i);
      }
    grid.clear();
    List<GameTile> gridTiles = [];
    _numbers.shuffle();
    for (int i = 0; i < _totalNumOfTiles; i++) {
      gridTiles.add(GameTile(id: _numbers[i], selected: false));
    }

    grid = gridTiles;
    return gridTiles;
  }


  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter1(),
      child: start?Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey,
          elevation: 0,
          title: const Text(
            "Test your Speed",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Consumer<Counter1>(
            builder: (_, counter, __) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Text(
                  "$p/600",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "HIT THE RABBIT",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5),
                      children: counter.getCounter < 0 ? generateTiles() : grid,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 90,
                          ),
                          const Text(
                            "Time Left:  ",
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(color: Colors.black, fontSize: 25),
                          ),
                          Text(
                            "$s",
                            textAlign: TextAlign.center,
                            style:
                            const TextStyle(color: Colors.red, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ):
      Container(
        child: AlertDialog(
          title: const Center(
            child: Text(
              "Game over",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Retry",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        Navigator.popUntil(
                            context, (route) => route.isFirst);
                      },
                      child: const Text(
                        "Return Home",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ],
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        ),
      )
    );
  }
}
