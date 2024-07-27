// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      streetName: json['streetName'] as String,
      postalCode: json['postalCode'] as String,
      cityName: json['cityName'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastName': instance.lastName,
      'streetName': instance.streetName,
      'postalCode': instance.postalCode,
      'cityName': instance.cityName,
    };
