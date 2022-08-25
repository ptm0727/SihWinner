import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/speedgame/counter1.dart';

import 'package:sih_brain_games/speedgame/imspeed.dart';

class GameTile extends StatefulWidget {
  int id;
  bool selected;
  GameTile({required this.id, required this.selected});

  @override
  State<GameTile> createState() => _TileState();
}

class _TileState extends State<GameTile> {
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  Widget build(BuildContext context) {
    Counter1 counter = Provider.of<Counter1>(context);
    return Container(
      child: GestureDetector(
        onTap: () {
            if (counter.getCounter == widget.id) {
              print(counter.getCounter);
              setState(() {
                if(po<60) {
                  po=po+3;
                }
                else {
                    po=po+4;
                  }
                counter.increment();
              });
            }

        },
        child: counter.getCounter==widget.id?Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset("assets/rabbit.png"),
        ):Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset("assets/panda.png"),
        )
      ),
    );
  }
}
