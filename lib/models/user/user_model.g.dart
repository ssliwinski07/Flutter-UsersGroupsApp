// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: (json['userId'] as num?)?.toInt(),
      userName: json['userName'] as String,
      lastName: json['lastName'] as String,
      streetName: json['streetName'] as String,
      postalCode: json['postalCode'] as String,
      cityName: json['cityName'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'lastName': instance.lastName,
      'streetName': instance.streetName,
      'postalCode': instance.postalCode,
      'cityName': instance.cityName,
    };
