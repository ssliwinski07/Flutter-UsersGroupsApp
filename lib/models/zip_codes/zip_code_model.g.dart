// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zip_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ZipCodeModelImpl _$$ZipCodeModelImplFromJson(Map<String, dynamic> json) =>
    _$ZipCodeModelImpl(
      zipCode: json['kod'] as String,
      city: json['miejscowosc'] as String,
    );

Map<String, dynamic> _$$ZipCodeModelImplToJson(_$ZipCodeModelImpl instance) =>
    <String, dynamic>{
      'kod': instance.zipCode,
      'miejscowosc': instance.city,
    };
