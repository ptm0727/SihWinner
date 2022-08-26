// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sih_brain_games/word_game/word_gmae_images.dart';
//import 'package:flutter_application_2/Question.dart';



class Word_game extends StatefulWidget {
  const Word_game({Key? key}) : super(key: key);

  @override
  State<Word_game> createState() => _Word_gameState();
}

class _Word_gameState extends State<Word_game> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var score = 0;
  var count = 0;
  var count1=0;

  void changingState() {
    if(count < 4)
    setState(() {
      count = (count + 1);
      count1 = 0;
    });
    else
      openDialog();
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Well Done"),
        actions: [
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text("Return Home"),
          ),
        ],
      ));

  var map = [
    [['lion'],['pigeon'],['bat'],['snake']],
    [['lion'],['pigeon'],['tiger'],['snake']],
    [['cheetah'],['pigeon'],['rat'],['snake']],
    [['lion'],['rat'],['bat'],['crocodile']],
    [['panther'],['pigeon'],['bat'],['snake']],
    [['lion'],['pigeon'],['tiger'],['crow']],
  ];
    var animals=[
      {0:'bat'},
      {1:'lion'},
      {2:'pigeon'},
      {3:'rat'},
      {4:'snake'},
      {5:'tiger'},
    ];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,

            elevation: 0.0,
            title: const Text('Guess the animal '
, style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold, color: Colors.black),            ),
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                      child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          color: const Color(0xff6053BC),
                          child: SizedBox(
                              width: double.infinity,
                              height: 400,
                              child: Images(animals[count][count] as String))))),
              Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                              child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Card(
                                      elevation: 0,
                                      //shadowColor: Colors.black,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                            children: [
                                              FlatButton(onPressed: (){
                                                if(animals[count][count] == map[count][0][0].toString())
                                                  changingState();

                                              }, child: Text(map[count][0][0].toString().toUpperCase() , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff6053BC)),),
                                                shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30.0),
                                                side: BorderSide(color: Color(0xff6053BC))
                                                ),
                                              ),
                                              FlatButton(onPressed: (){
                                                if(animals[count][count] == map[count][1][0].toString())
                                                  changingState();
                                              },
                                              child: Text(map[count][1][0].toString().toUpperCase() , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25 , color: Color(0xff6053BC)),),
                                              shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30.0),
                                              side: BorderSide(color: Color(0xff6053BC))
                              ),
    ),

                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                            children: [
                                              FlatButton(onPressed: () {
                                                if (animals[count][count] ==
                                                    map[count][2][0].toString())
                                                  changingState();
                                              }, child: Text(map[count][2][0].toString().toUpperCase() , style: TextStyle(fontSize: 25, color: Color(0xff6053BC) , fontWeight: FontWeight.bold)),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(60.0),
    side: BorderSide(color: Color(0xff6053BC))
    ),),
                                              FlatButton(onPressed: (){
                                                if(animals[count][count] == map[count][3][0].toString())
                                                  changingState();
                                              }, child: Text(map[count][3][0].toString().toUpperCase() , style: TextStyle(fontWeight:  FontWeight.bold , fontSize: 25, color: Color(0xff6053BC))),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(60.0),
    side: BorderSide(color: Color(0xff6053BC),
    ),),),
                                            ],
                                          ),
                                        ],
                                      ),
    ))),

                        ],
                      )
            ],
          ));
  }
}
