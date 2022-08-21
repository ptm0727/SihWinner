import 'package:flutter/material.dart';
import 'package:sih_brain_games/news/newspage.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.grey.shade800, Colors.grey.shade900]),
              //color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 2, color: Colors.cyan)),
          child: ExpansionTile(
              title: Text(
                title,
                style: const TextStyle(fontSize: 26, color: Colors.white),
              ),
              children: [
                ListTile(
                  title: Text(
                    subtitle ?? "",
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  trailing: MaterialButton(
                    elevation: 0,
                    color: Colors.blue,
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey.shade800, Colors.grey.shade900]),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 2, color: Colors.cyan)),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(25),
          child: ListTile(
              title: Center(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
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
      ),
    );
  }
}
