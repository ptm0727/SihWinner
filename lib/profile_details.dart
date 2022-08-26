import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile_Details extends StatefulWidget {
  const Profile_Details({Key? key}) : super(key: key);

  @override
  State<Profile_Details> createState() => _Profile_DetailsState();
}

class _Profile_DetailsState extends State<Profile_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(

        ),
      ),
    );
  }
}
