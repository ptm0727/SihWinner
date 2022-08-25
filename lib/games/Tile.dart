import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/games/counter.dart';

class Tile extends StatefulWidget {
  int id;
  bool selected;
  Tile({required this.id, required this.selected});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  void initState() {
    widget.selected = true;
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        widget.selected = false;
      });
    });
  }

  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    if (counter.getCounter < 0) {
      setState(() {
        widget.selected = true;
      });
      Future.delayed(const Duration(seconds: 5), () {
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
