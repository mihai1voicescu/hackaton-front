import 'package:charts_flutter/flutter.dart' as charts;

import 'model.dart';

class Extractor {
  static extract(List<StockPoint> list) {
    return [list.map((e) => (e.close)), list.map((e) => e.timestamp)];
  }

  static chartTimeSeries(List<StockPoint> list) {
    return charts.Series<StockPoint, DateTime>(
      id: 'Sales',
      domainFn: (StockPoint sales, _) => sales.timestamp,
      measureFn: (StockPoint sales, _) => sales.close,
      data: list,
    );
  }

  static chartTimeSeriesPoint(List<Point> list) {
    return charts.Series<Point, DateTime>(
      id: 'Sales',
      domainFn: (Point sales, _) => sales.point,
      measureFn: (Point sales, _) => sales.value,
      data: list,
    );
  }
}
