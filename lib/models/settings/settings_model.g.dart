// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsModelImpl _$$SettingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingsModelImpl(
      settingId: (json['settingId'] as num?)?.toInt(),
      settingName: json['settingName'] as String,
      settingValue: json['settingValue'] as String,
    );

Map<String, dynamic> _$$SettingsModelImplToJson(_$SettingsModelImpl instance) =>
    <String, dynamic>{
      'settingId': instance.settingId,
      'settingName': instance.settingName,
      'settingValue': instance.settingValue,
    };
