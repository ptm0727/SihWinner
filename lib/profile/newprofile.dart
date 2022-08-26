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
              'id': auth.currentUser?.uid,
              'game': p1,
              'uid': auth.currentUser?.uid,
              'date': DateTime.now().toString()
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      } else {
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
    return Scaffold(
        backgroundColor: Color(0xff6053BC),
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          //centerTitle: true,
          //title: Text("Check your ranks"),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15.0, top: 10.0),
                      child: RichText(
                          text: TextSpan(
                              text: "Leader",
                              style: TextStyle(
                                  color: Colors.black,
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
                    FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('points')
                            .orderBy('game', descending: true)
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

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: data.size,
                                  itemBuilder: (context, index) {
                                    var dictionary = {};
                                    print(index);
                                    if (index >= 1) {
                                      print('Greater than 1');
                                      if (data.docs[index]['game'] ==
                                          data.docs[index - 1]['game']) {
                                        print('Same');
                                      } else {
                                        i++;
                                      }
                                    }

                                    var name = data.docs[index]['uid'];
                                    if (data.docs[index].id ==
                                        auth.currentUser?.uid)
                                      name = "me";
                                    else if (data.docs[index].id == name)
                                      name = "anonymous";

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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0,
                                                            top: 10.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              name.toString(),
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              maxLines: 6,
                                                            )),
                                                        Text(
                                                            "Points: " +
                                                                ((data.docs[index]['game'] *
                                                                            1000)
                                                                        .toInt())
                                                                    .toString(),
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
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
                                  }),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
