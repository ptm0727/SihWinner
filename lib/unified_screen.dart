import 'package:flutter/material.dart';
import 'package:sih_brain_games/game_screen.dart';
import 'package:sih_brain_games/musicpage/music_screen.dart';
import 'package:sih_brain_games/news/category.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Unified extends StatelessWidget {
  ValueNotifier<int> pageNum = ValueNotifier(2);
  PageController _cont = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            "OldMan",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: pageNum,
          builder: (context, int page, child) => CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                animationDuration: const Duration(milliseconds: 300),
                color: Colors.black54,
                index: page,
                items: const <Widget>[
                  Icon(
                    Icons.newspaper_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(Icons.work, size: 30),
                  Icon(Icons.home_filled, size: 30),
                  Icon(Icons.music_note_outlined, size: 30),
                  Icon(Icons.settings, size: 30),
                ],
                onTap: (int index) {
                  pageNum.value = index;
                  _cont.animateToPage(index,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                },
              )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: ValueListenableBuilder(
          valueListenable: pageNum,
          builder: (context, int page, child) => PageView(
            controller: _cont,
            children: [
              const Category_Section(),
              const Text(
                "Page1",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              const GameScreen(),
              MusicScreen(),
              const Text(
                "Page4",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ],
            onPageChanged: (updated) {
              pageNum.value = updated;
            },
          ),
        ),
      ),
    );
  }
}
