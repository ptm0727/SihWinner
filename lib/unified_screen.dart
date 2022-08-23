import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:sih_brain_games/dark_mode_provider.dart';
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
  var darkData;
  Widget build(BuildContext context) {
    darkData = Provider.of<DarkMode>(context);
    return Scaffold(
      backgroundColor: darkData.dark ? Color(0xFF283240) : Color(0xff8e9eab),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "OldMan",
            style: TextStyle(
                fontSize: 50,
                color: darkData.dark ? Colors.white : Colors.black),
          ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: pageNum,
          builder: (context, int page, child) => CurvedNavigationBar(
                backgroundColor: darkData.dark
                    ? Colors.blueGrey.shade800
                    : Color(0xffeef2f3),
                animationDuration: const Duration(milliseconds: 300),
                buttonBackgroundColor:
                    darkData.dark ? Colors.deepPurple : Colors.green,
                color: darkData.dark ? Color(0xFF283240) : Color(0xff7B8994),
                index: page,
                items: const <Widget>[
                  Icon(
                    Icons.newspaper_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.work,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.home_filled,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.music_note_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
                onTap: (int index) {
                  pageNum.value = index;
                  _cont.animateToPage(index,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                },
              )),
      body: GradientContainer(
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
