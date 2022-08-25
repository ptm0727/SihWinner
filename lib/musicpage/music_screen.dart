import 'package:flutter/material.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:sih_brain_games/musicpage/music.dart';

class MusicScreen extends StatefulWidget {
  @override
  State<MusicScreen> createState() => _MusicScreen();
}

class _MusicScreen extends State<MusicScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 40),
            child: Divider(
              thickness: 2,
            ),
          ),
          const Center(
            child: Text(
              "Meditation",
              style: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
            ),
          ),
          AltButton(
            destination: music(
              a: 'm1.mp3',
              b: 'assets/pic1.png',
              c: 'Meditation music',
              d: '',
            ),
            title: "Mindful Meditation",
          ),
          AltButton(
            destination: music(
              a: 'm2.mp3',
              b: 'assets/pic2.png',
              c: 'Meditation music',
              d: '',
            ),
            title: "Spiritual Meditation",
          ),
          AltButton(
            destination: music(
              a: 'm3.mp3',
              b: 'assets/pic3.jpg',
              c: 'Meditation music',
              d: '',
            ),
            title: "Focused Meditation",
          ),
          AltButton(
            destination: music(
              a: 'm4.mp3',
              b: 'assets/pic4.jpg',
              c: 'Meditation music',
              d: '',
            ),
            title: "Progressive Relaxation",
          ),
        ]));
  }
}
