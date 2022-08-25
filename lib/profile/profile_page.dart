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

  @override
  Widget build(BuildContext context) {
    pointsmodel p = box.get('points');
    denominatormodel d = box1.get('d');
    final List<ChartData> chartData = [
      ChartData(0, 0.5),
      ChartData(1, 0.6),
      ChartData(2, 0.6),
      ChartData(3, 0.6),
      ChartData(4, 0.6),
      ChartData(5, 0.6),
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
          /*SfCartesianChart(
            primaryXAxis: CategoryAxis(
              name: "abc"
            ),

              series: <ChartSeries<ChartData, int>>[
                // Renders column chart
                ColumnSeries<ChartData, int>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                  enableTooltip: true,
                  width: 0.5,
                  spacing:0.2,
                  xAxisName: " ",
                )
              ]
          ),*/
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
              onPressed: (){
                box.put(
                    'points',
                    pointsmodel(
                      p1: 0,
                      p2: 0,
                      p3: 0,
                      p4: 0,
                      p5: 0,
                      p6: 0,
                    ));
                box1.put('d',
                    denominatormodel(d1: 0.1, d2: 0.1, d3: 0.1, d4: 0.1, d5: 0.1, d6: 0.1));
                setState(() {
                  p = box.get('points');
                  d = box1.get('d');
                });
              }, child: const Text("Reset Points")),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

}
class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
