import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_group_model.freezed.dart';
part 'user_group_model.g.dart';

@freezed
class UserGroupModel with _$UserGroupModel {
  factory UserGroupModel({
    required int userId,
    required int groupId,
  }) = _UserGroupModel;

  factory UserGroupModel.fromJson(Map<String, Object?> json) =>
      _$UserGroupModelFromJson(json);
}
