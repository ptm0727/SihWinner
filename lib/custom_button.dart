import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:sih_brain_games/dark_mode_provider.dart';

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
        child: Theme(
          data:
              ThemeData(dividerColor: Colors.transparent, fontFamily: "Nunito"),
          child: ExpansionTile(
              textColor: darkData.dark ? Colors.white : Colors.black,
              title: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w500),
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    subtitle ?? "",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  trailing: MaterialButton(
                    elevation: 0,
                    color: darkData.dark ? Colors.deepPurple : Colors.green,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => destination));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text(
                      "Play",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  Widget child;
  GradientContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: Provider.of<DarkMode>(context).dark
                  ? [
                      Color(0xFF283240),
                      Color(0xFF283240),
                      Colors.blueGrey.shade800
                    ]
                  : [Color(0xff8e9eab), Color(0xff8e9eab), Color(0xffeef2f3)])),
      child: child,
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
  var darkData;
  @override
  Widget build(BuildContext context) {
    darkData = Provider.of<DarkMode>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 60),
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
                title,
                style: const TextStyle(
                  fontSize: 25,
                ),
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
                title,
                style: const TextStyle(fontSize: 25),
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
