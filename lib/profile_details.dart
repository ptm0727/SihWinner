import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile_Details extends StatefulWidget {
  const Profile_Details({Key? key}) : super(key: key);

  @override
  State<Profile_Details> createState() => _Profile_DetailsState();
}

class _Profile_DetailsState extends State<Profile_Details> {
  TextEditingController usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade400,
                    image: DecorationImage(
                        image: FirebaseImage('gs://siholdman.appspot.com/p8KrMelXWu7e4AM0JGDX9sKQoNs5fF',),

                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                ElevatedButton(onPressed: (){

                },
                child: Text(
                  "Upload Image"
                ),),
                SizedBox(height: 5,),
                TextFormField(
                  controller: usernamecontroller,
                  obscureText: false,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: "UserName",
                    labelStyle: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.amber,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                TextFormField(
                  controller: usernamecontroller,
                  obscureText: false,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: "DOB",
                    labelStyle: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.amber,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
