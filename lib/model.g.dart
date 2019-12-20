// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    firstName: json['firstName'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'firstName': instance.firstName,
    };

StockPoint _$StockPointFromJson(Map<String, dynamic> json) {
  return StockPoint(
    DateTime.parse(json['timestamp'] as String),
    close: (json['close'] as num).toDouble(),
    high: (json['high'] as num).toDouble(),
    low: (json['low'] as num).toDouble(),
    open: (json['open'] as num).toDouble(),
    volume: json['volume'] as int,
  );
}

Map<String, dynamic> _$StockPointToJson(StockPoint instance) =>
    <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
      'timestamp': instance.timestamp.toIso8601String(),
    };

StockInfo _$StockInfoFromJson(Map<String, dynamic> json) {
  return StockInfo(
    (json['stockPoints'] as List)
        .map((e) => StockPoint.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['name'] as String,
  );
}

Map<String, dynamic> _$StockInfoToJson(StockInfo instance) => <String, dynamic>{
      'stockPoints': instance.stockPoints,
      'name': instance.name,
    };

Bot _$BotFromJson(Map<String, dynamic> json) {
  return Bot(
    json['name'] as String,
    json['code'] as String,
  );
}

Map<String, dynamic> _$BotToJson(Bot instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

Prediction _$PredictionFromJson(Map<String, dynamic> json) {
  return Prediction(
    (json['series'] as List)
        .map((e) => Point.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['actions'] as List)
        .map((e) => Action.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PredictionToJson(Prediction instance) =>
    <String, dynamic>{
      'series': instance.series,
      'actions': instance.actions,
    };

Point _$PointFromJson(Map<String, dynamic> json) {
  return Point(
    DateTime.parse(json['point'] as String),
    (json['value'] as num).toDouble(),
  );
}

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'point': instance.point.toIso8601String(),
      'value': instance.value,
    };

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    DateTime.parse(json['point'] as String),
    (json['value'] as num).toDouble(),
    json['amount'] as int,
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'point': instance.point.toIso8601String(),
      'value': instance.value,
      'amount': instance.amount,
    };
