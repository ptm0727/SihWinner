import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:sih_brain_games/Login/auth_service.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:sih_brain_games/pointsmodel.dart';
import 'package:sih_brain_games/main.dart';
import 'package:sih_brain_games/profile/newprofile.dart';
import 'dart:math';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:sih_brain_games/points_firebase.dart';

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

  Text medals(double b) {
    if (b <= 0.5) {
      return Text("🥇",style: TextStyle(
        color: Colors.brown,
          fontSize: 25
      ),);
    } else if (b > 0.5 && b <= .75) {
      return Text("🥇",style: TextStyle(
        color: Colors.grey,
          fontSize: 25
      ),);
    } else {
      return Text("🥇",style: TextStyle(
        color: Colors.amber,
          fontSize: 25
      ),);
    }
  }

  @override
  Widget build(BuildContext context) {
    int total=0;
    pointsmodel p = box.get('points');
    denominatormodel d = box1.get('d');
    final _auth = AuthService();
    final List<ChartData> chartData = [
      ChartData(0, p.p1 / d.d1),
      ChartData(1, p.p2 / d.d2),
      ChartData(2, p.p3 / d.d3),
      ChartData(3, p.p4 / d.d4),
      ChartData(4, p.p5 / d.d5),
      ChartData(5, p.p6 / d.d6),
    ];
    /*final List<ChartData> chartData1 = [
      ChartData(1, 0.6),
      ChartData(2, 0.6),
      ChartData(3, 0.8),
      ChartData(4, 0.62),
      ChartData(5, 0.5),
      ChartData(6, 0.43),
    ]..shuffle();*/
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Color(0xff6053BC),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RegularButton(
                  onPressed: () {
                    _auth.signOut();
                  },
                  title: "Sign Out"),
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
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const Text(
                "MyName@gmail.com",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Lottie.asset(
                'animations/${total/500}.json',
                width: 200,
                height: 200,
                repeat: false,
                fit: BoxFit.fill,
              ),
              /*RadarChart(
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
              ),*/
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(name: "abc"),
                  series: <ChartSeries<ChartData, int>>[
                    // Renders column chart
                    ColumnSeries<ChartData, int>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      enableTooltip: true,
                      width: 0.5,
                      spacing: 0.2,
                      xAxisName: " ",
                      color: Colors.amber,
                    )
                  ]),
              /*SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                      labelPosition: ChartDataLabelPosition.inside,
                      tickPosition: TickPosition.inside
                  ),
                series: <ChartSeries>[
                  // Renders line chart
                  LineSeries<ChartData, int>(
                      dataSource: chartData1,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y
                  )
                ],
                // Renders column chart

              ),*/
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Pair Game  ",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                  medals(p.p1/d.d1)
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Memory Game  ",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25),
                  ),
                  medals(p.p2/d.d2)
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              displayscore("Puzzle ${p.p3.toInt()} / ${d.d3.toInt()}"),
              const SizedBox(
                height: 12,
              ),
              displayscore("Speed ${p.p4.toInt()} / ${d.d4.toInt()}"),
              const SizedBox(
                height: 12,
              ),
              displayscore("Math ${p.p5.toInt()} / ${d.d5.toInt()}"),
              const SizedBox(
                height: 12,
              ),
              displayscore("Word ${p.p6.toInt()} / ${d.d6.toInt()}"),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    box.put(
                        'points',
                        pointsmodel(
                          p1: p.p1+150,
                          p2: p.p2+170,
                          p3: p.p3+135,
                          p4: p.p4+140,
                          p5: p.p5+180,
                          p6: p.p6+170,
                        ));
                    box1.put(
                        'd',
                        denominatormodel(
                            d1: d.d1+200,
                            d2: d.d2+200,
                            d3: d.d3+200,
                            d4: d.d4+200,
                            d5: d.d5+200,
                            d6: d.d6+200));
                    setState(() {
                      p = box.get('points');
                      d = box1.get('d');
                      total=(p.p1+p.p2+p.p3+p.p4+p.p5+p.p6) as int;
                    });
                  },
                  child: const Text("Reset Points")),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
