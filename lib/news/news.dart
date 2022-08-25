import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:sih_brain_games/news/Add_Blog.dart';
import 'package:sih_brain_games/news/newspage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      backgroundColor: darkData.dark ? Color(0xFF283240) : Color(0xff8e9eab),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: darkData.dark ? Colors.white : Colors.black,
        title: Center(
          child: Text(
            category,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: GradientContainer(
        child: PageView(
          controller: _cont,
          children: [
            SingleChildScrollView(
              child: Container(
                height: 10000000,
                child: StreamBuilder<QuerySnapshot>(
                  stream: users,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Somthing when wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading');
                    }
                    final data = snapshot.requireData;
                    var name = auth.currentUser?.uid;
                    return ListView.builder(
                        itemCount: data.size*2+1,
                        itemBuilder: (context, index) {
                          if(index<=data.size) {
                            if(index == 0)
                              return Text("My Story");
                            if (name == data.docs[index-1]['uid']) {
                              return commentdelete(
                                data.docs[index-1]['title'],
                                data.docs[index-1]['content'],
                                data.docs[index-1]['uid'],
                                data.docs[index-1]['id'],
                              );
                            }
                            return SizedBox.shrink();
                          }
                          else {
                            if(index == (data.size+1))
                              return Text("Other Story");
                            if (name == data.docs[index-data.size-1]['uid']) {
                              return SizedBox.shrink();
                            }
                            else
                              return comments(
                                data.docs[index-data.size-1]['title'],
                                data.docs[index-data.size-1]['id']
                              );
                          }
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Add_Blog("","")));
        },
        tooltip: 'Comments',
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
class comments extends StatelessWidget {
  const comments(
      this.comment,
      this.id,{
        Key? key,
      }) : super(key: key);
  final comment;
  final id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey.shade800, Colors.grey.shade900]),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2, color: Colors.cyan)),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(5),
          child: ListTile(
            title: Center(
              child: Text(
                comment,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),),
        ),
      ),
    );
  }
}


class commentdelete extends StatefulWidget {
  const commentdelete(
      this.title,
      this.content,
      this.id,
      this.uid,{
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
    return FirebaseFirestore.instance.collection('comment')
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future openDialog(id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Comment"),
        content: Text("Do You Want to Delete"),
        actions: [
          RaisedButton(onPressed: (){
            deletecomment(id);
            Navigator.pop(context);
          },
            child: Text("Yes"),
          ),
          RaisedButton(onPressed: (){
            Navigator.pop(context);
          },
            child: Text("No"),
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(

        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey.shade800, Colors.grey.shade900]),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2, color: Colors.cyan)),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(5),
          child: ListTile(
            leading: SizedBox.shrink(),
            title: Center(
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                  color: Colors.white,
                  Icons.more_horiz
              ),
              onPressed: (){
                openDialog(widget.id);
              },
            ),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => News(widget.title,widget.uid,widget.content,widget.id)));
            },
          ),
        ),
      ),
    );
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
            onTap: () {

            }),
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
