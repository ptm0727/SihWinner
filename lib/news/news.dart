import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:sih_brain_games/news/Add_Blog.dart';
import 'package:sih_brain_games/news/newspage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_brain_games/profile_details.dart';

import '../dark_mode_provider.dart';

class NewsSection extends StatefulWidget {
  const NewsSection(this.category, {Key? key}) : super(key: key);
  final category;
  @override
  _NewsSectionState createState() => _NewsSectionState(category);
}

class _NewsSectionState extends State<NewsSection> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  ValueNotifier<int> pageNum = ValueNotifier(2);
  PageController _cont = PageController(initialPage: 1);
  var category;
  _NewsSectionState(this.category);
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('content').snapshots();
  var darkData;
  @override
  Widget build(BuildContext context) {
    darkData = Provider.of<DarkMode>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: darkData.dark ? Colors.white : Colors.black,
        title: const Center(
          child: Text(
            "BLOG",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),

        child: PageView(
          controller: _cont,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Color(0xff6053BC),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: users,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text('Somthing when wrong');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Column(
                              children: const [
                                CircularProgressIndicator(),
                                Text(
                                  'Loading',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            );
                          }
                          final data = snapshot.requireData;
                          var name = auth.currentUser?.uid;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: data.size * 2 + 2,
                                itemBuilder: (context, index) {
                                  if (index <= data.size) {
                                    if (index == 0) {
                                      return const Center(
                                        child: Text(
                                          "My Stories",
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      );
                                    }
                                    if (name == data.docs[index - 1]['uid']) {
                                      return commentdelete(
                                        data.docs[index - 1]['title'],
                                        data.docs[index - 1]['content'],
                                        data.docs[index - 1]['uid'],
                                        data.docs[index - 1]['id'],
                                      );
                                    }
                                    return SizedBox.shrink();
                                  } else {
                                    if (index == (data.size + 1))
                                      return const Center(
                                        child: Text(
                                          "Others Stories",
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      );
                                    if (name ==
                                        data.docs[index - data.size - 2]['uid']) {
                                      return SizedBox.shrink();
                                    } else
                                      return comments(
                                          data.docs[index - data.size - 2]
                                              ['title'],
                                          data.docs[index - data.size - 2]
                                              ['content'],
                                          data.docs[index - data.size - 2]['uid'],
                                          data.docs[index - data.size - 2]['id']);
                                  }
                                }),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Add_Blog("", "")));
        },
        tooltip: 'Comments',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class comments extends StatelessWidget {
  const comments(
    this.title,
    this.content,
    this.uid,
    this.id, {
    Key? key,
  }) : super(key: key);
  final title;
  final id;
  final content;
  final uid;

  @override
  Widget build(BuildContext context) {
    return RegularButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => News(title, uid, content, id)));
        },
        title: title);
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    //   child: Container(
    //     height: 90,
    //     decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //             colors: [Colors.grey.shade800, Colors.grey.shade900]),
    //         borderRadius: BorderRadius.circular(15),
    //         border: Border.all(width: 2, color: Colors.cyan)),
    //     child: ClipRRect(
    //       clipBehavior: Clip.hardEdge,
    //       borderRadius: BorderRadius.circular(5),
    //       child: ListTile(
    //         title: Center(
    //           child: Text(
    //             comment,
    //             style: const TextStyle(fontSize: 25, color: Colors.white),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class commentdelete extends StatefulWidget {
  const commentdelete(
    this.title,
    this.content,
    this.uid,
    this.id, {
    Key? key,
  }) : super(key: key);
  final title;
  final id;
  final content;
  final uid;

  @override
  State<commentdelete> createState() => _commentdeleteState();
}

class _commentdeleteState extends State<commentdelete> {
  Future<void> deletecomment(var id) {
    return FirebaseFirestore.instance
        .collection('content')
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future openDialog(id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Delete  Story"),
            actions: [
              RaisedButton(
                onPressed: () {
                  deletecomment(id);
                  Navigator.pop(context);
                },
                child: Text("Yes"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No"),
              )
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return RegularButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    News(widget.title, widget.uid, widget.content, widget.id)));
      },
      title: widget.title,
      trailing: IconButton(
        icon: Icon(color: Colors.black, Icons.more_horiz),
        onPressed: () {
          openDialog(widget.id);
        },
      ),
    );
    //   Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    //   child: Container(
    //     decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //             colors: [Colors.grey.shade800, Colors.grey.shade900]),
    //         borderRadius: BorderRadius.circular(15),
    //         border: Border.all(width: 2, color: Colors.cyan)),
    //     child: ClipRRect(
    //       clipBehavior: Clip.hardEdge,
    //       borderRadius: BorderRadius.circular(5),
    //       child: ListTile(
    //         leading: SizedBox.shrink(),
    //         title: Center(
    //           child: Text(
    //             widget.title,
    //             style: const TextStyle(fontSize: 25, color: Colors.white),
    //           ),
    //         ),
    //         trailing: IconButton(
    //           icon: Icon(color: Colors.white, Icons.more_horiz),
    //           onPressed: () {
    //             openDialog(widget.id);
    //           },
    //         ),
    //         onTap: () {
    //           Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (context) => News(widget.title, widget.uid,
    //                       widget.content, widget.id)));
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}

class headlines extends StatelessWidget {
  headlines(
    this.headline,
    this.category,
    this.article,
    this.id, {
    Key? key,
  }) : super(key: key);
  final headline;
  final category;
  final article;
  final id;

  var darkData;
  @override
  Widget build(BuildContext context) {
    darkData = Provider.of<DarkMode>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      child: Neumorphic(
        style: darkData.dark
            ? NeumorphicStyle(
                intensity: 0.8,
                depth: 4,
                shadowLightColor: Colors.blueGrey.shade700,
                shadowDarkColor: Color(0xff0B0E12),
                color: Color(0xff333E52),
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(17)))
            : NeumorphicStyle(
                intensity: 0.7,
                depth: 4,
                shadowLightColor: Color(0xffeef2f3),
                shadowDarkColor: Colors.grey.shade800,
                color: Color(0xff83929E),
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(17))),
        child: ListTile(
            title: Center(
              child: Text(
                headline,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            onTap: () {}),
      ),
    );
  }
}
// return Padding(
//   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//   child: Container(
//     height: 90,
//     decoration: BoxDecoration(
//         gradient: LinearGradient(
//             colors: [Colors.grey.shade800, Colors.grey.shade900]),
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(width: 2, color: Colors.cyan)),
//     child: ClipRRect(
//       clipBehavior: Clip.hardEdge,
//       borderRadius: BorderRadius.circular(5),
//       child: ListTile(
//           title: Center(
//             child: Text(
//               headline,
//               style: const TextStyle(fontSize: 25, color: Colors.white),
//             ),
//           ),
//           leading: Container(
//             child: Image(
//               image: FirebaseImage('gs://siholdman.appspot.com/' + image),
//               // Works with standard parameters, e.g.
//               fit: BoxFit.fitWidth,
//               width: 100,
//               // ... etc.
//             ),
//           ),
//
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         News(headline, image, article, id)));
//           }),
//     ),
//   ),
// );
//   }
// }

// class headlines extends StatelessWidget {
//   const headlines(
//     this.image,
//     this.headline,
//     this.category,
//     this.article, {
//     Key? key,
//   }) : super(key: key);
//   final image;
//   final headline;
//   final category;
//   final article;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//         margin: EdgeInsets.all(5),
//         decoration: const BoxDecoration(
//           color: Color(0xFFFFE1E1),
//           borderRadius: BorderRadius.all(Radius.circular(7)),
//         ),
//         child: Row(
//           children: [
//             Container(
//               child: Image.network(
//                 image,
//               ),
//               padding: EdgeInsets.all(9),
//               width: 90,
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   Text(
//                     headline,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "Category: " + category,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//               padding: EdgeInsets.all(2),
//             ),
//           ],
//         ),
//       ),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => News(headline, image, article)),
//         );
//       },
//     );
//   }
// }
