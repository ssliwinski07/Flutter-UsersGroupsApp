// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_groups_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsersGroupsModel _$UsersGroupsModelFromJson(Map<String, dynamic> json) {
  return _UsersGroupsModel.fromJson(json);
}

/// @nodoc
mixin _$UsersGroupsModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<UserModel> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersGroupsModelCopyWith<UsersGroupsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersGroupsModelCopyWith<$Res> {
  factory $UsersGroupsModelCopyWith(
          UsersGroupsModel value, $Res Function(UsersGroupsModel) then) =
      _$UsersGroupsModelCopyWithImpl<$Res, UsersGroupsModel>;
  @useResult
  $Res call({int id, String name, List<UserModel> users});
}

/// @nodoc
class _$UsersGroupsModelCopyWithImpl<$Res, $Val extends UsersGroupsModel>
    implements $UsersGroupsModelCopyWith<$Res> {
  _$UsersGroupsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersGroupsModelImplCopyWith<$Res>
    implements $UsersGroupsModelCopyWith<$Res> {
  factory _$$UsersGroupsModelImplCopyWith(_$UsersGroupsModelImpl value,
          $Res Function(_$UsersGroupsModelImpl) then) =
      __$$UsersGroupsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, List<UserModel> users});
}

/// @nodoc
class __$$UsersGroupsModelImplCopyWithImpl<$Res>
    extends _$UsersGroupsModelCopyWithImpl<$Res, _$UsersGroupsModelImpl>
    implements _$$UsersGroupsModelImplCopyWith<$Res> {
  __$$UsersGroupsModelImplCopyWithImpl(_$UsersGroupsModelImpl _value,
      $Res Function(_$UsersGroupsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? users = null,
  }) {
    return _then(_$UsersGroupsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersGroupsModelImpl implements _UsersGroupsModel {
  _$UsersGroupsModelImpl(
      {required this.id,
      required this.name,
      required final List<UserModel> users})
      : _users = users;

  factory _$UsersGroupsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersGroupsModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<UserModel> _users;
  @override
  List<UserModel> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'UsersGroupsModel(id: $id, name: $name, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersGroupsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersGroupsModelImplCopyWith<_$UsersGroupsModelImpl> get copyWith =>
      __$$UsersGroupsModelImplCopyWithImpl<_$UsersGroupsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersGroupsModelImplToJson(
      this,
    );
  }
}

abstract class _UsersGroupsModel implements UsersGroupsModel {
  factory _UsersGroupsModel(
      {required final int id,
      required final String name,
      required final List<UserModel> users}) = _$UsersGroupsModelImpl;

  factory _UsersGroupsModel.fromJson(Map<String, dynamic> json) =
      _$UsersGroupsModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<UserModel> get users;
  @override
  @JsonKey(ignore: true)
  _$$UsersGroupsModelImplCopyWith<_$UsersGroupsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
