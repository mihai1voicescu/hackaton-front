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
    var chartseries =
        Extractor.chartTimeSeriesPoint(Services().lastPrediction.series);

    return FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 0.9,
      child: charts.TimeSeriesChart(
        [chartseries],
        animate: false,
        behaviors: [
          charts.SeriesLegend(),
          charts.PanAndZoomBehavior(),
        ],
      ),
    );
  }
}
