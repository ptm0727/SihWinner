// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sih_brain_games/word_game/word_gmae_images.dart';
//import 'package:flutter_application_2/Question.dart';



class Word_game extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  State<Word_game> createState() => _Word_gameState();
}

class _Word_gameState extends State<Word_game> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int score = 0;
  int count = 0;
  void changingState(String value) {
    setState(() {
      count = (count + 1);
      value = '';
    });
  }

  var map = [
    {0: 'bat'},
    {1: 'bear'},
    {2: 'bee'},
    {3: 'butterfly'},
    {4: 'cat'},
    {5: 'cow'},
    {6: 'crow'},
    {7: 'dog'},
    {8: 'donkey'},
    {9: 'elephant'},
    {10: 'horse'},
    {11: 'lion'},
    {12: 'pigeon'},
    {13: 'rat'},
    {14: 'snake'},
    {15: 'tiger'},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: Colors.amber,
      ),
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.indigoAccent,
            title: Text('Let\'s Test Your Knowledge '),
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                      child: Card(
                          elevation: 50,
                          shadowColor: Colors.black,
                          child: SizedBox(
                              width: double.infinity,
                              height: 400,
                              child: Images(map[count][count] as String))))),
              Center(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                              child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Card(
                                      elevation: 50,
                                      shadowColor: Colors.black,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText:
                                          'Guess what\'s is in the snap',
                                        ),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          if (value == map[count][count]) {
                                            changingState(value);

                                            return 'You Are correct';
                                          } else
                                            return 'Try Again!';
                                        },
                                      )))),
                          Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20.0),
                                child: Card(
                                    elevation: 50,
                                    shadowColor: Color.fromARGB(0, 35, 35, 35),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Validate will return true if the form is valid, or false if
                                        // the form is invalid.
                                        if (_formKey.currentState!.validate()) {
                                          // Process data.

                                        }
                                      },
                                      child: const Text('Submit'),
                                    )),
                              )),
                        ],
                      )))
            ],
          )),
    );
  }
}
