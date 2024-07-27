// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_with_users_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupWithUsersModel _$GroupWithUsersModelFromJson(Map<String, dynamic> json) {
  return _GroupWithUsersModel.fromJson(json);
}

/// @nodoc
mixin _$GroupWithUsersModel {
  GroupModel get group => throw _privateConstructorUsedError;
  List<UserModel> get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupWithUsersModelCopyWith<GroupWithUsersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupWithUsersModelCopyWith<$Res> {
  factory $GroupWithUsersModelCopyWith(
          GroupWithUsersModel value, $Res Function(GroupWithUsersModel) then) =
      _$GroupWithUsersModelCopyWithImpl<$Res, GroupWithUsersModel>;
  @useResult
  $Res call({GroupModel group, List<UserModel> user});

  $GroupModelCopyWith<$Res> get group;
}

/// @nodoc
class _$GroupWithUsersModelCopyWithImpl<$Res, $Val extends GroupWithUsersModel>
    implements $GroupWithUsersModelCopyWith<$Res> {
  _$GroupWithUsersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as GroupModel,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ) as $Val);
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
abstract class _$$GroupWithUsersModelImplCopyWith<$Res>
    implements $GroupWithUsersModelCopyWith<$Res> {
  factory _$$GroupWithUsersModelImplCopyWith(_$GroupWithUsersModelImpl value,
          $Res Function(_$GroupWithUsersModelImpl) then) =
      __$$GroupWithUsersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GroupModel group, List<UserModel> user});

  @override
  $GroupModelCopyWith<$Res> get group;
}

/// @nodoc
class __$$GroupWithUsersModelImplCopyWithImpl<$Res>
    extends _$GroupWithUsersModelCopyWithImpl<$Res, _$GroupWithUsersModelImpl>
    implements _$$GroupWithUsersModelImplCopyWith<$Res> {
  __$$GroupWithUsersModelImplCopyWithImpl(_$GroupWithUsersModelImpl _value,
      $Res Function(_$GroupWithUsersModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? user = null,
  }) {
    return _then(_$GroupWithUsersModelImpl(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as GroupModel,
      user: null == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupWithUsersModelImpl implements _GroupWithUsersModel {
  _$GroupWithUsersModelImpl(
      {required this.group, required final List<UserModel> user})
      : _user = user;

  factory _$GroupWithUsersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupWithUsersModelImplFromJson(json);

  @override
  final GroupModel group;
  final List<UserModel> _user;
  @override
  List<UserModel> get user {
    if (_user is EqualUnmodifiableListView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_user);
  }

  @override
  String toString() {
    return 'GroupWithUsersModel(group: $group, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupWithUsersModelImpl &&
            (identical(other.group, group) || other.group == group) &&
            const DeepCollectionEquality().equals(other._user, _user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, group, const DeepCollectionEquality().hash(_user));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupWithUsersModelImplCopyWith<_$GroupWithUsersModelImpl> get copyWith =>
      __$$GroupWithUsersModelImplCopyWithImpl<_$GroupWithUsersModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupWithUsersModelImplToJson(
      this,
    );
  }
}

abstract class _GroupWithUsersModel implements GroupWithUsersModel {
  factory _GroupWithUsersModel(
      {required final GroupModel group,
      required final List<UserModel> user}) = _$GroupWithUsersModelImpl;

  factory _GroupWithUsersModel.fromJson(Map<String, dynamic> json) =
      _$GroupWithUsersModelImpl.fromJson;

  @override
  GroupModel get group;
  @override
  List<UserModel> get user;
  @override
  @JsonKey(ignore: true)
  _$$GroupWithUsersModelImplCopyWith<_$GroupWithUsersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
