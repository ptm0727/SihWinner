import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/games/counter.dart';

import '../main.dart';
import '../pointsmodel.dart';
import 'memory_game_new.dart';

class Tile extends StatefulWidget {
  int id;
  bool selected;
  Tile({required this.id, required this.selected});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  Timer? timer;
  @override
  void initState() {
    widget.selected = true;
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        widget.selected = false;
      });
    });
  }


  Widget build(BuildContext context) {

    Counter counter = Provider.of<Counter>(context);
    void changepoints()
    {
      pointsmodel p=box.get('points');
      denominatormodel d=box1.get('d');
      double x=p.p1;
      x=x+counter.getCounter*10;
      double y=d.d1;
      y=y+100;
      box.put('points',
          pointsmodel(p1: p.p1, p2: x, p3: p.p3, p4: p.p4, p5: p.p5, p6: p.p6,
          )
      );
      box1.put('d', denominatormodel(d1: d.d1, d2: y, d3: d.d3, d4: d.d4, d5: d.d5, d6: d.d6));
    }
    if (counter.getCounter < 0) {
      setState(() {
        widget.selected = true;
      });
      Future.delayed(const Duration(seconds: 6), () {
        setState(() {
          widget.selected = false;
        });
        counter.setCounter = 0;
      });
    }
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            primary: Colors.indigo),
        onPressed: () {
          if (!widget.selected && counter.getCounter >= 0) {
            counter.increment();
            print(counter.getCounter);
            setState(() {
              widget.selected = true;
            });
            if (counter.getCounter != widget.id) {
              showDialog(
                  barrierDismissible: false,
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
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    changepoints();
                                    Navigator.pop(context);
                                    widget.selected = false;
                                    counter.setCounter = -10;
                                  },
                                  child: const Text(
                                    "Retry",
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ),
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    changepoints();
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
                    );
                  });
            }
            if (counter.getCounter + 1 == 10) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Center(
                        child: Text(
                          "You won!",
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
                                    widget.selected = false;
                                    counter.setCounter = -10;
                                  },
                                  child: const Text(
                                    "Replay",
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
                    );
                  });
            }
          }
        },
        child: Text(
          widget.id.toString(),
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.05,
              color: widget.selected ? Colors.white : Colors.transparent),
        ),
      ),
    );
  }
}
