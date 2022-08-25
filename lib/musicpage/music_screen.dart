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
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Color(0xff6053BC),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "Meditation",
                  style: TextStyle(
                      fontSize: 35,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),
              AltButton(
                imagePath: "assets/img_1.png",
                destination: music(
                  a: 'm1.mp3',
                  b: 'assets/pic1.png',
                  c: 'Meditation music',
                  d: '',
                ),
                title: "Mindful Meditation",
              ),
              AltButton(
                imagePath: "assets/img_2.png",
                destination: music(
                  a: 'm2.mp3',
                  b: 'assets/pic2.png',
                  c: 'Meditation music',
                  d: '',
                ),
                title: "Spiritual Meditation",
              ),
              AltButton(
                imagePath: "assets/img_3.png",
                destination: music(
                  a: 'm3.mp3',
                  b: 'assets/pic3.jpg',
                  c: 'Meditation music',
                  d: '',
                ),
                title: "Focused Meditation",
              ),
              AltButton(
                imagePath: "assets/img_4.png",
                destination: music(
                  a: 'm4.mp3',
                  b: 'assets/pic4.jpg',
                  c: 'Meditation music',
                  d: '',
                ),
                title: "Progressive Relaxation",
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ]));
  }
}
