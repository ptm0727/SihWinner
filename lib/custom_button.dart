import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'news/news.dart';

class Button extends StatelessWidget {
  Widget destination;
  String? leading;
  String title;
  String? subtitle;
  Widget? trailing;
  Button(
      {this.leading,
      required this.destination,
      required this.title,
      this.subtitle,
      this.trailing});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      child: Neumorphic(
        style: NeumorphicStyle(
            intensity: 0.8,
            depth: 6,
            shadowLightColor: Colors.blueGrey.shade700,
            shadowDarkColor: Color(0xff0B0E12),
            color: Color(0xff333E52),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(17))),
        child: Theme(
          data:
              ThemeData(dividerColor: Colors.transparent, fontFamily: "Nunito"),
          child: ExpansionTile(
              title: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 26, color: Colors.white),
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    subtitle ?? "",
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  trailing: MaterialButton(
                    elevation: 0,
                    color: Colors.deepPurple,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => destination));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text(
                      "Play",
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

class RegularButton extends StatelessWidget {
  Function() onPressed;
  Widget? leading;
  String title;
  Widget? trailing;
  RegularButton(
      {this.leading,
      required this.onPressed,
      required this.title,
      this.trailing});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      child: Neumorphic(
        style: NeumorphicStyle(
            intensity: 0.8,
            depth: 6,
            shadowLightColor: Colors.blueGrey.shade700,
            shadowDarkColor: Color(0xff0B0E12),
            color: Color(0xff333E52),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(17))),
        child: ListTile(
            title: Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            onTap: onPressed),
      ),
    );
  }
}

class AltButton extends StatelessWidget {
  final destination;
  Widget? leading;
  final title;
  Widget? trailing;
  AltButton(
      {this.leading,
      required this.destination,
      required this.title,
      this.trailing});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      child: Neumorphic(
        style: NeumorphicStyle(
            intensity: 0.8,
            depth: 6,
            shadowLightColor: Colors.blueGrey.shade700,
            shadowDarkColor: Color(0xff0B0E12),
            color: Color(0xff333E52),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(17))),
        child: ListTile(
            title: Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            onTap: () {
              if (destination is String) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsSection(destination)));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => destination));
              }
            }),
      ),
    );
  }
}
