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
