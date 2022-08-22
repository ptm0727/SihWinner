import 'package:flutter/material.dart';
import 'package:sih_brain_games/game_screen.dart';
import 'package:sih_brain_games/musicpage/music_screen.dart';
import 'package:sih_brain_games/news/category.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sih_brain_games/profile/profile_page.dart';
import 'package:sih_brain_games/yoga/yoga_home.dart';

class Unified extends StatelessWidget {
  ValueNotifier<int> pageNum = ValueNotifier(2);
  PageController _cont = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF283240),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            "OldMan",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: pageNum,
          builder: (context, int page, child) => CurvedNavigationBar(
                backgroundColor: Colors.blueGrey.shade800,
                animationDuration: const Duration(milliseconds: 300),
                buttonBackgroundColor: Colors.deepPurple,
                color: Color(0xFF283240),
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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF283240),
              Color(0xFF283240),
              Colors.blueGrey.shade800
            ])),
        child: ValueListenableBuilder(
          valueListenable: pageNum,
          builder: (context, int page, child) => PageView(
            controller: _cont,
            children: [
              const Category_Section(),
              const yoga_home(),
              const GameScreen(),
              MusicScreen(),
              profile()
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
