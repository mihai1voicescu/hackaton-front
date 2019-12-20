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
    json['name'] as String,
    json['value'] as int,
    DateTime.parse(json['time'] as String),
    sxName: json['sxName'] as String,
  );
}

Map<String, dynamic> _$StockPointToJson(StockPoint instance) =>
    <String, dynamic>{
      'value': instance.value,
      'time': instance.time.toIso8601String(),
      'name': instance.name,
      'sxName': instance.sxName,
    };
