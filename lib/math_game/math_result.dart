import 'package:flutter/material.dart';
import 'package:sih_brain_games/math_game/maths_game_home.dart';
import 'package:sih_brain_games/math_game/maths_game_home.dart';


class result extends StatefulWidget {
  int score;
  result(this.score);

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    Color maincolor = Color(0xFF252c4a);
    Color secondcolor = Color(0xFF117eeb);
    return Scaffold(
        backgroundColor: maincolor,
        appBar: AppBar(
          title: Text('Math Game'),
          centerTitle: true,
          backgroundColor: secondcolor,
        ),
        body: Center(
          child: Container(
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Your Score is",
                style: TextStyle(
                    color: secondcolor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "${widget.score}",
                style: TextStyle(
                    color: secondcolor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const mathgame()));
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: secondcolor, width: 1.0),
                  shape: StadiumBorder(),
                  // backgroundColor: Colors.orange,
                  // shadowColor: Colors.amber
                ),
                child: Text(
                  "Restart Quiz",
                  style: TextStyle(
                    color: secondcolor,
                    fontSize: 15,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
