import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_users_group_app/models/models.dart';

part 'group_with_users_model.freezed.dart';
part 'group_with_users_model.g.dart';

@freezed
class GroupWithUsersModel with _$GroupWithUsersModel {
  factory GroupWithUsersModel({
    required GroupModel group,
    required List<UserModel> users,
  }) = _GroupWithUsersModel;

  factory GroupWithUsersModel.fromJson(Map<String, Object?> json) =>
      _$GroupWithUsersModelFromJson(json);
}
