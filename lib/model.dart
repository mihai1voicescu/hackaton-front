import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(nullable: false)
class User {
  final String name, firstName;

  User({this.firstName, this.name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(nullable: false)
class StockPoint {
  final double open, high, low, close;
  final int volume;
  final DateTime timestamp;

  StockPoint(this.timestamp,
      {this.close, this.high, this.low, this.open, this.volume});

  factory StockPoint.fromJson(Map<String, dynamic> json) =>
      _$StockPointFromJson(json);

  Map<String, dynamic> toJson() => _$StockPointToJson(this);
}

@JsonSerializable(nullable: false)
class StockInfo {
  final List<StockPoint> stockPoints;
  final String name;

  StockInfo(this.stockPoints, this.name);

  factory StockInfo.fromJson(Map<String, dynamic> json) =>
      _$StockInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StockInfoToJson(this);
}

@JsonSerializable(nullable: false)
class Bot {
  final String name, code;

  Bot(this.name, this.code);

  factory Bot.fromJson(Map<String, dynamic> json) => _$BotFromJson(json);

  Map<String, dynamic> toJson() => _$BotToJson(this);
}

@JsonSerializable(nullable: true)
class Prediction {
  final List<Point> series;
  final List<Action> actions;
  final int balance, stocks;

  Prediction(this.series, this.actions, this.balance, this.stocks);

  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionToJson(this);
}

@JsonSerializable(nullable: false)
class Point {
  DateTime point;
  double value;

  Point(this.point, this.value);

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);
}

@JsonSerializable(nullable: false)
class Action {
  DateTime point;
  String action;
  int amount;

  Action(this.point, this.action, this.amount);

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);
}
