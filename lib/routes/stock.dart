import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackaton_front/model.dart';
import 'package:hackaton_front/services.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hackaton_front/services.dart';
import 'package:hackaton_front/extractors.dart';
import 'package:hackaton_front/model.dart';

class Stock extends StatefulWidget {
  static const route = "/stock";

  @override
  _StockState createState() => _StockState();
}

class _StockState extends State<Stock> {
  Future<StockInfo> futureStockInfo;

  StockInfo stockInfo;

  @override
  Widget build(BuildContext context) {
    if (stockInfo == null) return Container(child: CircularProgressIndicator());

    var points = stockInfo.stockPoints;
    var chartseries = Extractor.chartTimeSeries(points);

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

  @override
  void initState() {
    super.initState();
    Services().getStockInfo().then((v) {
      print(v);
      stockInfo = v;
      this.setState(() {});
    }).catchError((error) => print(error));
  }
}
