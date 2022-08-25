import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../points_firebase.dart';
import '../pointsmodel.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  int i = 0;
  Color my = Colors.brown, CheckMyColor = Colors.white;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> updatescore(var p1) {
    return FirebaseFirestore.instance
        .collection('points')
        .where('uid', isEqualTo: auth.currentUser?.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      var n = querySnapshot.docs.length;
      if (n == 0) {
        FirebaseFirestore.instance
            .collection('points')
            .doc(auth.currentUser?.uid)
            .set({
          'id':auth.currentUser?.uid,

              'game': p1,
              'uid': auth.currentUser?.uid,
              'date': DateTime.now().toString()
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }
      else{
        FirebaseFirestore.instance
            .collection('points')
            .doc(auth.currentUser?.uid)
            .update({'game': p1})
            .then((value) => print("User Updated"))
            .catchError((error) => print("Failed to update user: $error"));
      }
      print(n);
    });
  }

  @override
  Widget build(BuildContext context) {
    pointsmodel p = box.get('points');
    denominatormodel d = box1.get('d');
    points_firebase x = points_firebase();

    var r = TextStyle(color: Colors.purpleAccent, fontSize: 34);
    return Stack(
      children: <Widget>[
        Scaffold(
            body: Container(
          margin: EdgeInsets.only(top: 65.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15.0, top: 10.0),
                child: RichText(
                    text: TextSpan(
                        text: "Leader",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: " Board",
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold))
                    ])),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Global Rank Board: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                  child: FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('points')
                          .get(),
                      builder: (context, snapshot) {
                        updatescore((p.p1 / d.d1 +
                                p.p2 / d.d2 +
                                p.p3 / d.d3 +
                                p.p4 / d.d4 +
                                p.p5 / d.d5 +
                                p.p6 / d.d6) /
                            6);
                        if (snapshot.hasData) {
                          i = 0;
                          var data = snapshot.requireData;
                          return ListView.builder(
                              itemCount: data.size,
                              itemBuilder: (context, index) {
                                print(index);
                                if (index >= 1) {
                                  var dick = {};
                                  print('Greater than 1');
                                  if (data.docs[index]['game'] ==
                                      data.docs[index - 1]['game']) {
                                    print('Same');
                                  } else {
                                    i++;
                                  }
                                }

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: i == 0
                                                  ? Colors.amber
                                                  : i == 1
                                                      ? Colors.grey
                                                      : i == 2
                                                          ? Colors.brown
                                                          : Colors.white,
                                              width: 3.0,
                                              style: BorderStyle.solid),
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0, top: 10.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          data.docs[index]
                                                              ['uid'],
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .deepPurple,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          maxLines: 6,
                                                        )),
                                                    Text("Points: " +
                                                        data.docs[index]['game']
                                                            .toString()),
                                                  ],
                                                ),
                                              ),
                                              Flexible(child: Container()),
                                              i == 0
                                                  ? Text("🥇", style: r)
                                                  : i == 1
                                                      ? Text(
                                                          "🥈",
                                                          style: r,
                                                        )
                                                      : i == 2
                                                          ? Text(
                                                              "🥉",
                                                              style: r,
                                                            )
                                                          : Text(''),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }))
            ],
          ),
        )),
      ],
    );
  }
}
