import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/games/counter.dart';
import 'Tile.dart';

class MemoryGame1 extends StatefulWidget {
  const MemoryGame1({Key? key}) : super(key: key);

  @override
  State<MemoryGame1> createState() => _MemoryGame1State();
}

class _MemoryGame1State extends State<MemoryGame1> {
  List<Tile> grid = [];
  final int _totalNumOfTiles = 9;
  final List<int> _numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  List<Tile> generateTiles() {
    grid.clear();
    List<Tile> gridTiles = [];
    _numbers.shuffle();
    for (int i = 0; i < _totalNumOfTiles; i++) {
      gridTiles.add(Tile(id: _numbers[i], selected: false));
    }

    grid = gridTiles;
    return gridTiles;
  }

  void initState() {
    grid = generateTiles();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey,
          elevation: 0,
          title: const Text(
            "Test your memory",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Consumer<Counter>(
            builder: (_, counter, __) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Tap the numbers in order (from 1 to 9)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Next number to press : ${counter.getCounter < 0 ? 1 : counter.getCounter + 1}",
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
                              crossAxisCount: 3),
                      children: counter.getCounter < 0 ? generateTiles() : grid,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
