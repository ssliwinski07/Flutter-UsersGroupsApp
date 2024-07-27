// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserGroupModel _$UserGroupModelFromJson(Map<String, dynamic> json) {
  return _UserGroupModel.fromJson(json);
}

/// @nodoc
mixin _$UserGroupModel {
  int get userId => throw _privateConstructorUsedError;
  int get groupId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserGroupModelCopyWith<UserGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGroupModelCopyWith<$Res> {
  factory $UserGroupModelCopyWith(
          UserGroupModel value, $Res Function(UserGroupModel) then) =
      _$UserGroupModelCopyWithImpl<$Res, UserGroupModel>;
  @useResult
  $Res call({int userId, int groupId});
}

/// @nodoc
class _$UserGroupModelCopyWithImpl<$Res, $Val extends UserGroupModel>
    implements $UserGroupModelCopyWith<$Res> {
  _$UserGroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? groupId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserGroupModelImplCopyWith<$Res>
    implements $UserGroupModelCopyWith<$Res> {
  factory _$$UserGroupModelImplCopyWith(_$UserGroupModelImpl value,
          $Res Function(_$UserGroupModelImpl) then) =
      __$$UserGroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int groupId});
}

/// @nodoc
class __$$UserGroupModelImplCopyWithImpl<$Res>
    extends _$UserGroupModelCopyWithImpl<$Res, _$UserGroupModelImpl>
    implements _$$UserGroupModelImplCopyWith<$Res> {
  __$$UserGroupModelImplCopyWithImpl(
      _$UserGroupModelImpl _value, $Res Function(_$UserGroupModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? groupId = null,
  }) {
    return _then(_$UserGroupModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserGroupModelImpl implements _UserGroupModel {
  _$UserGroupModelImpl({required this.userId, required this.groupId});

  factory _$UserGroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserGroupModelImplFromJson(json);

  @override
  final int userId;
  @override
  final int groupId;

  @override
  String toString() {
    return 'UserGroupModel(userId: $userId, groupId: $groupId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGroupModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, groupId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserGroupModelImplCopyWith<_$UserGroupModelImpl> get copyWith =>
      __$$UserGroupModelImplCopyWithImpl<_$UserGroupModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserGroupModelImplToJson(
      this,
    );
  }
}

abstract class _UserGroupModel implements UserGroupModel {
  factory _UserGroupModel(
      {required final int userId,
      required final int groupId}) = _$UserGroupModelImpl;

  factory _UserGroupModel.fromJson(Map<String, dynamic> json) =
      _$UserGroupModelImpl.fromJson;

  @override
  int get userId;
  @override
  int get groupId;
  @override
  @JsonKey(ignore: true)
  _$$UserGroupModelImplCopyWith<_$UserGroupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
