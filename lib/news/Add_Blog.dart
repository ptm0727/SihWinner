import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Add_Blog extends StatefulWidget {
  const Add_Blog(this.headline,this.id, {Key? key}) : super(key: key);
  final headline;
  final id;

  @override
  _Add_BlogState createState() => _Add_BlogState();
}

class _Add_BlogState extends State<Add_Blog> {
  ValueNotifier<int> pageNum = ValueNotifier(2);
  final FirebaseAuth auth = FirebaseAuth.instance;
  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  Future<void> addComment(var comm) {
    var res = generateRandomString(30);
    var name = auth.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection('comment')
        .doc(res)
        .set({'comment': comm, 'news': widget.id, 'id': res,'uid': name})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }


  final TextEditingController titlefield = TextEditingController();
  final TextEditingController contentfield = TextEditingController();

  Future openDialog(id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Publilsh"),

        actions: [
          ElevatedButton(onPressed: (){
            publishcontent();
            Navigator.pop(context);
            Navigator.pop(context);
          },
            child: Text("Yes"),
          ),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          },
            child: Text("No"),
          )
        ],
      ));

  Future<void> publishcontent() {
    var res = generateRandomString(30);
    var name = auth.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection('content')
        .doc(res)
        .set({'title': titlefield.text, 'content': contentfield.text, 'id': res,'uid': name})
        .then((value) => print("Content Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          "Add Blog",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titlefield,
                decoration: InputDecoration(
                  labelText: "Title",
                  labelStyle: TextStyle(
                    color: Colors.black
                  ),
                  fillColor: Colors.black,
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: contentfield,
                decoration: InputDecoration(
                  labelText: "Story",
                  labelStyle: TextStyle(
                      color: Colors.black
                  ),
                  fillColor: Colors.black,
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: 100000000,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog("");
        },
        tooltip: 'Comment',
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
      this.comment,{
        Key? key,
      }) : super(key: key);
  final comment;

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
      this.comment,
      this.id,{
        Key? key,
      }) : super(key: key);
  final comment;
  final id;

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
          ElevatedButton(onPressed: (){
            deletecomment(id);
            Navigator.pop(context);
          },
            child: Text("Yes"),
          ),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          },
            child: Text("No"),
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {
    var a = widget.comment;
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
                a,
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
          ),
        ),
      ),
    );
  }
}
