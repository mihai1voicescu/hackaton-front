import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hackaton_front/services.dart';
import 'package:hackaton_front/extractors.dart';
import 'package:hackaton_front/model.dart';

Future<StockInfo> stockFuture() {}

Widget createChart(BuildContext context, AsyncSnapshot snapshot) {
  print(snapshot);
  if(snapshot.data) {
    var points = snapshot.data.stockPoints;
    var chartseries = Extractor.chartTimeSeries(points);
    var chart = TimeSeriesLineAnnotationChart(chartseries);

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 400.0,
          child: chart,
        );
      },
    );
  } else {
    return CircularProgressIndicator();
  }

}


class SecondScreen extends StatelessWidget {
  static const route = "/second";

  // StockPoint list in "data" -> close (double) | timestamp (DateTime)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
            FutureBuilder(
                future: Services().getStockInfo(),
                initialData: [],
                builder: (context, snapshot) {
                  return createChart(context, snapshot);
                }),
          ],
        ),
      ),
    );
  }
}

class TimeSeriesLineAnnotationChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  TimeSeriesLineAnnotationChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory TimeSeriesLineAnnotationChart.withSampleData() {
    return new TimeSeriesLineAnnotationChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(seriesList, animate: animate, behaviors: [
      new charts.RangeAnnotation([
        new charts.LineAnnotationSegment(
            new DateTime(2017, 10, 4), charts.RangeAnnotationAxisType.domain,
            startLabel: 'Oct 4'),
        new charts.LineAnnotationSegment(
            new DateTime(2017, 10, 15), charts.RangeAnnotationAxisType.domain,
            endLabel: 'Oct 15'),
      ]),
    ]);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 1000),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}




