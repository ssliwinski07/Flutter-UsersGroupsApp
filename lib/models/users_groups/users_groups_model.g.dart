// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_groups_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersGroupsModelImpl _$$UsersGroupsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UsersGroupsModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      users: (json['users'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UsersGroupsModelImplToJson(
        _$UsersGroupsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'users': instance.users,
    };
