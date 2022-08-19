import 'package:flutter/material.dart';
import 'package:sih_brain_games/musicpage/music.dart';

class musicbuttons extends StatefulWidget {
  @override
  State<musicbuttons> createState() => _musicbuttons();

}

class _musicbuttons extends State<musicbuttons>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => music(a: 'm1.mp3', b: 'assets/pic1.png', c: 'Meditation music', d: '',)));
                    },
                    child: const Text(
                      "Music 1",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => music(a: 'm2.mp3', b: 'assets/pic2.png', c: 'Meditation music', d: '',)));
                    },
                    child: const Text(
                      "Music 2",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => music(a: 'm3.mp3', b: 'assets/pic3.jpg', c: 'Meditation music', d: '',)));
                    },
                    child: const Text(
                      "Music 3",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => music(a: 'm4.mp3', b: 'assets/pic4.jpg', c: 'Meditation music', d: '',)));
                    },
                    child: const Text(
                      "Music 4",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )),
              ]
    ),
        )
      )
    );
  }

}