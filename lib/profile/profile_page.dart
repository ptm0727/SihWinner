import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:radar_chart/radar_chart.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:sih_brain_games/pointsmodel.dart';
import 'package:sih_brain_games/main.dart';
import 'dart:math';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profile();
}

class _profile extends State<profile> {
  Widget displayscore(String s) {
    return RegularButton(onPressed: () {}, title: s);
    // return Container(
    //   child: ClipRRect(
    //     clipBehavior: Clip.hardEdge,
    //     borderRadius: BorderRadius.circular(25),
    //     child: Container(
    //       decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //               colors: [Colors.grey.shade800, Colors.grey.shade900]),
    //           //color: Colors.grey.shade700,
    //           borderRadius: BorderRadius.circular(25),
    //           border: Border.all(width: 2, color: Colors.cyan)),
    //       child: Text(
    //         s,
    //         style: TextStyle(fontSize: 20, color: Colors.white),
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    pointsmodel p = box.get('points');
    denominatormodel d = box1.get('d');

    List<double> values1 = [
      p.p1.toDouble() / 100, //d.d1.toDouble(),
      p.p2.toDouble() / 100, //d.d2.toDouble(),
      p.p3.toDouble() / 100, //d.d3.toDouble(),
      p.p4.toDouble() / 100, //d.d4.toDouble(),
      p.p5.toDouble() / 100, //d.d5.toDouble(),
      p.p6.toDouble() / 100, //d.d6.toDouble(),
    ];
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 17,
          ),
          const CircleAvatar(
            radius: 56,
            backgroundImage: AssetImage('assets/img.png'),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "MyName",
            style: TextStyle(
                //color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          const Text(
            "MyName@gmail.com",
            style: TextStyle(
                // color: Colors.blueGrey,
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          RadarChart(
            radius: 150, length: 6, initialAngle: pi / 3,
            //backgroundColor: Colors.white,
            //borderStroke: 2,
            borderColor: Colors.deepPurpleAccent.withOpacity(0.4),
            radialStroke: 2,
            radialColor: Colors.grey.shade600,
            radars: [
              RadarTile(
                values: values1,
                borderStroke: 2,
                borderColor: Colors.green,
                backgroundColor: Colors.green.withOpacity(0.6),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          displayscore("Memory ${p.p1.toInt()} ${d.d1.toInt()}"),
          const SizedBox(
            height: 12,
          ),
          displayscore("Pair ${p.p2.toInt()} ${d.d2.toInt()}"),
          const SizedBox(
            height: 12,
          ),
          displayscore("Speed ${p.p3.toInt()} ${d.d3.toInt()}"),
          const SizedBox(
            height: 12,
          ),
          displayscore("Puzzle ${p.p4.toInt()} ${d.d4.toInt()}"),
          const SizedBox(
            height: 12,
          ),
          displayscore("Math ${p.p5.toInt()} ${d.d5.toInt()}"),
          const SizedBox(
            height: 12,
          ),
          displayscore("Word ${p.p6.toInt()} ${d.d6.toInt()}"),
        ],
      ),
    );
  }
}
