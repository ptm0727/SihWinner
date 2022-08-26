import 'package:sih_brain_games/math_game/Math_question_list.dart';
import 'package:flutter/material.dart';
import 'package:sih_brain_games/math_game/math_result.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: homepage(),
//       debugShowCheckedModeBanner: false, //to stop the debug
//     );
//   }
// }

class mathgame extends StatefulWidget {
  const mathgame({Key? key}) : super(key: key);

  @override
  State<mathgame> createState() => _mathgameState();
}

class _mathgameState extends State<mathgame> {
  Color maincolor = Color(0xFF252c4a);
  Color secondcolor = Color(0xFF117eeb);
  bool isPresssed = false;
  Color ifWrong = Colors.red;
  Color iftrue = Colors.green;
  Color btncolor = Color(0xFF117eeb);
  int score = 0;
  PageController? _pagecontroller = PageController(initialPage: 0);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff6053BC),
          title: Text(
            'Are you Ramanujan ? ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          //actions: [
          // leading: IconButton(
          //   //alignment: Alignment.topLeft,
          //     onPressed: () => {},
          //     //onPressed: (() => add_new_Tranc_process(context)),
          //     icon: Icon(
          //       Icons.arrow_back,
          //       color: Colors.white,
          //     ))
        //],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        // padding: EdgeInsets.all(10),
        child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pagecontroller,
            onPageChanged: (page) {
              setState(() {
                isPresssed = false;
              });
            },
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Color(0xff6053BC),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Question ${index + 1}/${questions.length} ",
                            style: const TextStyle(
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                                fontSize: 28.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: const Divider(
                        color: Colors.white,
                        height: 8.0,
                        thickness: 1.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${questions[index].question}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.0),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    for (int i = 0; i < questions[index].answers!.length; i++)
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          bottom: 18,
                        ),
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: MaterialButton(
                          padding: EdgeInsets.all(20),
                          color: isPresssed
                              ? (questions[index]
                              .answers!
                              .entries
                              .toList()[i]
                              .value)
                              ? iftrue
                              : ifWrong
                              : Colors.white,
                          shape: const StadiumBorder(),
                          //color: secondcolor,
                          onPressed: isPresssed
                              ? () {}
                              : () {
                            setState(() {
                              isPresssed = true;
                            });
                            if (questions[index]
                                .answers!
                                .entries
                                .toList()[i]
                                .value) {
                              score += 10;
                              print(score);
                            }
                          },
                          child: Text(
                            questions[index].answers!.keys.toList()[i],
                            style: TextStyle(
                                color: Color(0xff6053BC),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          // ignore: sort_child_properties_last

                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.white, width: 1.0),
                            shape: StadiumBorder(),
                            // backgroundColor: Colors.orange,
                            // shadowColor: Colors.amber
                          ),
                          onPressed: isPresssed
                              ? index + 1 == questions.length
                              ? () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        result(score)));
                          }
                              : () {
                            _pagecontroller!.nextPage(
                                duration: Duration(microseconds: 70),
                                curve: Curves.linear);
                          }
                              : null,
                          child: Text(
                            index + 1 == questions.length
                                ? "See result"
                                : "Next Question",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
