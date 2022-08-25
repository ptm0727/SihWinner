
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {

  int i = 0;
  Color my = Colors.brown, CheckMyColor = Colors.white;
  final FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
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
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('points')
                              .where('uid', isEqualTo: auth.currentUser?.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              i = 0;
                              var data=snapshot.requireData;
                              return ListView.builder(
                                  itemCount: data.size,
                                  itemBuilder: (context, index) {
                                    print(index);
                                    if (index >= 1) {
                                      print('Greater than 1');
                                      if (data.docs[index]
                                          ['points'] ==
                                          data.docs[index - 1]
                                              ['points']) {
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
                                                        top: 10.0, left: 15.0),
                                                    child: Row(
                                                      children: <Widget>[
                                                        CircleAvatar(
                                                            child: Container(
                                                                decoration: const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/img_5.png'),
                                                                        fit: BoxFit
                                                                            .fill)))),
                                                      ],
                                                    ),
                                                  ),
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
                                                                  ['Name'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .deepPurple,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                              maxLines: 6,
                                                            )),
                                                        Text("Points: " +
                                                                data
                                                                .docs[index]
                                                                ['points']
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
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 13.0,
                                                        right: 20.0),
                                                    child: RaisedButton(
                                                      onPressed: () {
                                                      },
                                                      child: Text(
                                                        "Challenge",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                      color: Colors.deepPurple,
                                                    ),
                                                  ),
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
