import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:sih_brain_games/math_game/math_result.dart';
import 'dart:math';



class mathgame extends StatefulWidget {
  const mathgame({Key? key}) : super(key: key);
  //int a = 0;
  @override
  State<mathgame> createState() => _mathgame();
}

class _mathgame extends State<mathgame> {
  ////
  ///
  ///
  ///
  Color maincolor = Color(0xFF252c4a);
  Color secondcolor = Color(0xFF117eeb);
  bool isPresssed = false;
  Color ifWrong = Colors.red;
  Color iftrue = Colors.green;
  Color btncolor = Color(0xFF117eeb);
  int score = 0;
  int a = 1, x = 0, y = 0;
  int b = 1, c = 2, d = 3;
  late int ans = 0;
  int count = 0;
  final abc = TextEditingController();
  Random random = Random();
  Random random2 = Random.secure();
  int answer = 0;
  String answerfinal = 'CorrectAnswer';
  final mycontroller1 = TextEditingController();
  final mycontroller2 = TextEditingController();

/////
  ///
  ///
  ///
  ///
  // Widget questionGen(int a, int b) {
  //   return Container(
  //     padding: EdgeInsets.all(20),
  //     child: Row(children: [
  //       Container(width: MediaQueryof(context).size.width*0.5,)

  //     ]),
  //   );
  // }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///

  void CheckEqui1(int x, int y, int ans) {
    if (ans == (x + y)) {
      answerfinal = 'Correct Answer';
      //multiplication();

      setState(() {
        b = generateRandomNumber1();
        c = generateRandomNumber2();
        a = ans;
        score += 1;
      });
    } else {
      setState(() {
        answerfinal = 'Wrong Answer';
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => result(score)));
      });
    }
  }

  void CheckEqui2(int x, int y, int ans) {
    if (ans == (x * y)) {
      answerfinal = 'Correct Answer';
      //multiplication();

      setState(() {
        b = generateRandomNumber1();
        c = generateRandomNumber2();
        a = ans;
        score += 2;
      });
    } else {
      setState(() {
        answerfinal = 'Wrong Answer';
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => result(score)));
      });
    }
  }

  int generateRandomNumber2() {
    setState(() {
      x = random.nextInt(10) + 5;
    });
    return x;
  }

  int generateRandomNumber1() {
    setState(() {
      y = random2.nextInt(5) + 2;
    });
    return y;
  }

/////
  ///
  ///
  ///
  ///

  PageController? _pagecontroller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    mycontroller1.text = "";
    mycontroller2.text = " ";
    b = generateRandomNumber2();
    c = generateRandomNumber1();
    return Scaffold(
        backgroundColor: maincolor,
        appBar: AppBar(
          title: Text('Math Game'),
          centerTitle: true,
          backgroundColor: secondcolor,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "The current value is",
                      style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$a",
                      style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Add $b",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "and get 1 points",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 80,
                            height: 60,
                            child: TextField(
                              controller: mycontroller1,
                              decoration: const InputDecoration(
                                  labelText: 'Your Answer',
                                  border: OutlineInputBorder()),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(height: 10),
                          FloatingActionButton(
                            onPressed: () {
                              CheckEqui1(a, b,
                                  double.parse(mycontroller1.text).toInt());
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // Retrieve the text the that user has entered by using the
                                    // TextEditingController.
                                    content: Text(answerfinal),
                                  );
                                },
                              );
                            },
                            tooltip: 'Show me the value!',
                            child: const Icon(Icons.text_fields),
                          ),
                        ],
                      ),
                    ),

                    ///
                    ///
                    ///
                    ///
                    ///
                    ///
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Multiply $c",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "and get 2 points",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            width: 80,
                            height: 60,
                            child: TextField(
                              controller: mycontroller2,
                              decoration: const InputDecoration(
                                  labelText: 'Your Answer',
                                  border: OutlineInputBorder()),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(height: 10),
                          FloatingActionButton(
                            onPressed: () {
                              CheckEqui2(a, c,
                                  double.parse(mycontroller2.text).toInt());
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // Retrieve the text the that user has entered by using the
                                    // TextEditingController.
                                    content: Text(answerfinal),
                                  );
                                },
                              );
                            },
                            tooltip: 'Show me the value!',
                            child: const Icon(Icons.text_fields),
                          ),
                        ],
                      ),
                    )
                    //
                    ///
                    ///
                    ///
                    ///
                    ///
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
