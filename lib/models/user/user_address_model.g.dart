// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAddressModelImpl _$$UserAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAddressModelImpl(
      streetName: json['streetName'] as String,
      postalCode: json['postalCode'] as String,
      cityName: json['cityName'] as String,
    );

Map<String, dynamic> _$$UserAddressModelImplToJson(
        _$UserAddressModelImpl instance) =>
    <String, dynamic>{
      'streetName': instance.streetName,
      'postalCode': instance.postalCode,
      'cityName': instance.cityName,
    };
