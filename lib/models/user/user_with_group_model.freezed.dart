// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_with_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserWithGroupModel _$UserWithGroupModelFromJson(Map<String, dynamic> json) {
  return _UserWithGroupModel.fromJson(json);
}

/// @nodoc
mixin _$UserWithGroupModel {
  UserModel get user => throw _privateConstructorUsedError;
  GroupModel get group => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserWithGroupModelCopyWith<UserWithGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWithGroupModelCopyWith<$Res> {
  factory $UserWithGroupModelCopyWith(
          UserWithGroupModel value, $Res Function(UserWithGroupModel) then) =
      _$UserWithGroupModelCopyWithImpl<$Res, UserWithGroupModel>;
  @useResult
  $Res call({UserModel user, GroupModel group});

  $UserModelCopyWith<$Res> get user;
  $GroupModelCopyWith<$Res> get group;
}

/// @nodoc
class _$UserWithGroupModelCopyWithImpl<$Res, $Val extends UserWithGroupModel>
    implements $UserWithGroupModelCopyWith<$Res> {
  _$UserWithGroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? group = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as GroupModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupModelCopyWith<$Res> get group {
    return $GroupModelCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserWithGroupModelImplCopyWith<$Res>
    implements $UserWithGroupModelCopyWith<$Res> {
  factory _$$UserWithGroupModelImplCopyWith(_$UserWithGroupModelImpl value,
          $Res Function(_$UserWithGroupModelImpl) then) =
      __$$UserWithGroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel user, GroupModel group});

  @override
  $UserModelCopyWith<$Res> get user;
  @override
  $GroupModelCopyWith<$Res> get group;
}

/// @nodoc
class __$$UserWithGroupModelImplCopyWithImpl<$Res>
    extends _$UserWithGroupModelCopyWithImpl<$Res, _$UserWithGroupModelImpl>
    implements _$$UserWithGroupModelImplCopyWith<$Res> {
  __$$UserWithGroupModelImplCopyWithImpl(_$UserWithGroupModelImpl _value,
      $Res Function(_$UserWithGroupModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? group = null,
  }) {
    return _then(_$UserWithGroupModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as GroupModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserWithGroupModelImpl implements _UserWithGroupModel {
  _$UserWithGroupModelImpl({required this.user, required this.group});

  factory _$UserWithGroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserWithGroupModelImplFromJson(json);

  @override
  final UserModel user;
  @override
  final GroupModel group;

  @override
  String toString() {
    return 'UserWithGroupModel(user: $user, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWithGroupModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.group, group) || other.group == group));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, group);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWithGroupModelImplCopyWith<_$UserWithGroupModelImpl> get copyWith =>
      __$$UserWithGroupModelImplCopyWithImpl<_$UserWithGroupModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserWithGroupModelImplToJson(
      this,
    );
  }
}

abstract class _UserWithGroupModel implements UserWithGroupModel {
  factory _UserWithGroupModel(
      {required final UserModel user,
      required final GroupModel group}) = _$UserWithGroupModelImpl;

  factory _UserWithGroupModel.fromJson(Map<String, dynamic> json) =
      _$UserWithGroupModelImpl.fromJson;

  @override
  UserModel get user;
  @override
  GroupModel get group;
  @override
  @JsonKey(ignore: true)
  _$$UserWithGroupModelImplCopyWith<_$UserWithGroupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
