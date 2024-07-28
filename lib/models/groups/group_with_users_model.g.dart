// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_with_users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupWithUsersModelImpl _$$GroupWithUsersModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupWithUsersModelImpl(
      group: GroupModel.fromJson(json['group'] as Map<String, dynamic>),
      users: (json['users'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GroupWithUsersModelImplToJson(
        _$GroupWithUsersModelImpl instance) =>
    <String, dynamic>{
      'group': instance.group,
      'users': instance.users,
    };
