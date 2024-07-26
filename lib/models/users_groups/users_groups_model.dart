import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_users_group_app/models/models.dart';

part 'users_groups_model.freezed.dart';
part 'users_groups_model.g.dart';

@freezed
class UsersGroupsModel with _$UsersGroupsModel {
  factory UsersGroupsModel({
    required int id,
    required String name,
    required List<UserModel> users,
  }) = _UsersGroupsModel;

  factory UsersGroupsModel.fromJson(Map<String, Object?> json) =>
      _$UsersGroupsModelFromJson(json);
}
