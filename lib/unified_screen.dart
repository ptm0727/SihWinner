import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:sih_brain_games/dark_mode_provider.dart';
import 'package:sih_brain_games/game_screen.dart';
import 'package:sih_brain_games/musicpage/music_screen.dart';
import 'package:sih_brain_games/news/category.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sih_brain_games/profile/newprofile.dart';
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
      backgroundColor: darkData.dark ? Colors.black54 : Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "Sahasrara",
            style: TextStyle(
                fontSize: 50,
                color: darkData.dark ? Colors.white : Colors.black),
          ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: pageNum,
          builder: (context, int page, child) => CurvedNavigationBar(
                // backgroundColor: darkData.dark
                //     ? Colors.blueGrey.shade800
                //     : Color(0xffeef2f3),
                backgroundColor: Colors.transparent,
                animationDuration: const Duration(milliseconds: 300),
                buttonBackgroundColor:
                    darkData.dark ? Colors.deepPurple : Color(0xff6495ed),
                color: darkData.dark ? Color(0xFF283240) : Colors.white,
                index: page,
                items: <Widget>[
                  Icon(
                    Icons.newspaper_outlined,
                    size: 30,
                    color: page == 0 ? Colors.white : Colors.grey,
                  ),
                  Icon(
                    Icons.play_arrow,
                    size: 30,
                    color: page == 1 ? Colors.white : Colors.grey,
                  ),
                  Icon(
                    Icons.home_filled,
                    size: 30,
                    color: page == 2 ? Colors.white : Colors.grey,
                  ),
                  Icon(
                    Icons.music_note_outlined,
                    size: 30,
                    color: page == 3 ? Colors.white : Colors.grey,
                  ),
                  Icon(
                    Icons.settings,
                    size: 30,
                    color: page == 4 ? Colors.white : Colors.grey,
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
              // profile(),
              LeaderBoard()
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
