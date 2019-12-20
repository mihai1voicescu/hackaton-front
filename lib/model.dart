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
  final int value;
  final DateTime time;
  final String name, sxName;

  StockPoint(this.name, this.value, this.time, {this.sxName = "Default"});

  factory StockPoint.fromJson(Map<String, dynamic> json) =>
      _$StockPointFromJson(json);

  Map<String, dynamic> toJson() => _$StockPointToJson(this);
}
