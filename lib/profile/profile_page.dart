import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:sih_brain_games/pointsmodel.dart';
import 'package:sih_brain_games/main.dart';
import 'dart:math';
import 'package:syncfusion_flutter_charts/charts.dart';

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

  String checkstars(double b) {
    if (b <= 0.5) {
      return "assets/img_5.png";
    } else if (b > 0.5 && b <= .75) {
      return "assets/img_6.png";
    } else {
      return "assets/img_7.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    pointsmodel p = box.get('points');
    denominatormodel d = box1.get('d');
    final List<ChartData> chartData = [
      ChartData(0, p.p1 / d.d1),
      ChartData(1, p.p2 / d.d2),
      ChartData(2, p.p3 / d.d3),
      ChartData(3, p.p4 / d.d4),
      ChartData(4, p.p5 / d.d5),
      ChartData(5, p.p6 / d.d6),
    ];
    final List<ChartData> chartData1 = [
      ChartData(1, 0.6),
      ChartData(2, 0.6),
      ChartData(3, 0.8),
      ChartData(4, 0.62),
      ChartData(5, 0.5),
      ChartData(6, 0.43),
    ]..shuffle();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Color(0xff6053BC),
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
              displayscore("Pair ${p.p1.toInt()} / ${d.d1.toInt()}"),
              const SizedBox(
                height: 12,
              ),
              displayscore("Memory ${p.p2.toInt()} / ${d.d2.toInt()}"),
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
                          p1: 290,
                          p2: 350,
                          p3: 250,
                          p4: 270,
                          p5: 200,
                          p6: 210,
                        ));
                    box1.put(
                        'd',
                        denominatormodel(
                            d1: 360,
                            d2: 400,
                            d3: 260,
                            d4: 360,
                            d5: 250,
                            d6: 250));
                    setState(() {
                      p = box.get('points');
                      d = box1.get('d');
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
