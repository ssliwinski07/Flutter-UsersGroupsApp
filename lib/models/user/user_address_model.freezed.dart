// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAddressModel _$UserAddressModelFromJson(Map<String, dynamic> json) {
  return _UserAddressModel.fromJson(json);
}

/// @nodoc
mixin _$UserAddressModel {
  String get streetName => throw _privateConstructorUsedError;
  String get postalCode => throw _privateConstructorUsedError;
  String get cityName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAddressModelCopyWith<UserAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAddressModelCopyWith<$Res> {
  factory $UserAddressModelCopyWith(
          UserAddressModel value, $Res Function(UserAddressModel) then) =
      _$UserAddressModelCopyWithImpl<$Res, UserAddressModel>;
  @useResult
  $Res call({String streetName, String postalCode, String cityName});
}

/// @nodoc
class _$UserAddressModelCopyWithImpl<$Res, $Val extends UserAddressModel>
    implements $UserAddressModelCopyWith<$Res> {
  _$UserAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streetName = null,
    Object? postalCode = null,
    Object? cityName = null,
  }) {
    return _then(_value.copyWith(
      streetName: null == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAddressModelImplCopyWith<$Res>
    implements $UserAddressModelCopyWith<$Res> {
  factory _$$UserAddressModelImplCopyWith(_$UserAddressModelImpl value,
          $Res Function(_$UserAddressModelImpl) then) =
      __$$UserAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String streetName, String postalCode, String cityName});
}

/// @nodoc
class __$$UserAddressModelImplCopyWithImpl<$Res>
    extends _$UserAddressModelCopyWithImpl<$Res, _$UserAddressModelImpl>
    implements _$$UserAddressModelImplCopyWith<$Res> {
  __$$UserAddressModelImplCopyWithImpl(_$UserAddressModelImpl _value,
      $Res Function(_$UserAddressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streetName = null,
    Object? postalCode = null,
    Object? cityName = null,
  }) {
    return _then(_$UserAddressModelImpl(
      streetName: null == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAddressModelImpl implements _UserAddressModel {
  _$UserAddressModelImpl(
      {required this.streetName,
      required this.postalCode,
      required this.cityName});

  factory _$UserAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAddressModelImplFromJson(json);

  @override
  final String streetName;
  @override
  final String postalCode;
  @override
  final String cityName;

  @override
  String toString() {
    return 'UserAddressModel(streetName: $streetName, postalCode: $postalCode, cityName: $cityName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAddressModelImpl &&
            (identical(other.streetName, streetName) ||
                other.streetName == streetName) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, streetName, postalCode, cityName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAddressModelImplCopyWith<_$UserAddressModelImpl> get copyWith =>
      __$$UserAddressModelImplCopyWithImpl<_$UserAddressModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAddressModelImplToJson(
      this,
    );
  }
}

abstract class _UserAddressModel implements UserAddressModel {
  factory _UserAddressModel(
      {required final String streetName,
      required final String postalCode,
      required final String cityName}) = _$UserAddressModelImpl;

  factory _UserAddressModel.fromJson(Map<String, dynamic> json) =
      _$UserAddressModelImpl.fromJson;

  @override
  String get streetName;
  @override
  String get postalCode;
  @override
  String get cityName;
  @override
  @JsonKey(ignore: true)
  _$$UserAddressModelImplCopyWith<_$UserAddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
