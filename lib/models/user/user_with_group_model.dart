import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_users_group_app/models/models.dart';

part 'user_with_group_model.freezed.dart';
part 'user_with_group_model.g.dart';

@freezed
class UserWithGroupModel with _$UserWithGroupModel {
  factory UserWithGroupModel({
    required UserModel user,
    required GroupModel group,
  }) = _UserWithGroupModel;

  factory UserWithGroupModel.fromJson(Map<String, Object?> json) =>
      _$UserWithGroupModelFromJson(json);
}
