// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_with_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserWithGroupModelImpl _$$UserWithGroupModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserWithGroupModelImpl(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      group: GroupModel.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserWithGroupModelImplToJson(
        _$UserWithGroupModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'group': instance.group,
    };
