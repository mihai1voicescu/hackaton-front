import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackaton_front/model.dart';
import 'package:hackaton_front/services.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hackaton_front/services.dart';
import 'package:hackaton_front/extractors.dart';
import 'package:hackaton_front/model.dart';

class Sim extends StatefulWidget {
  static const route = "/simulation";

  @override
  _SimState createState() => _SimState();
}

class _SimState extends State<Sim> {
  @override
  Widget build(BuildContext context) {
    var lp = Services().lastPrediction;
    var chartseries = Extractor.chartTimeSeriesPoint(lp.series);

    return Scaffold(
      appBar: AppBar(
        title: Text("Simulation results"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          ListTile(
            title: Text("Balance"),
            trailing: Text("${lp.balance}"),
          ),
          ListTile(
            title: Text("Stocks"),
            trailing: Text("${lp.stocks}"),
          ),
          Expanded(
            child: charts.TimeSeriesChart(
              chartseries,
              animate: false,
              behaviors: [
                charts.SeriesLegend(),
                charts.PanAndZoomBehavior(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
