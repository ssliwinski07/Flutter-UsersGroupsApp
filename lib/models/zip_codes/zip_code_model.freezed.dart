// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zip_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ZipCodeModel _$ZipCodeModelFromJson(Map<String, dynamic> json) {
  return _ZipCodeModel.fromJson(json);
}

/// @nodoc
mixin _$ZipCodeModel {
  @JsonKey(name: 'kod')
  String get zipCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'miejscowosc')
  String get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZipCodeModelCopyWith<ZipCodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZipCodeModelCopyWith<$Res> {
  factory $ZipCodeModelCopyWith(
          ZipCodeModel value, $Res Function(ZipCodeModel) then) =
      _$ZipCodeModelCopyWithImpl<$Res, ZipCodeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'kod') String zipCode,
      @JsonKey(name: 'miejscowosc') String city});
}

/// @nodoc
class _$ZipCodeModelCopyWithImpl<$Res, $Val extends ZipCodeModel>
    implements $ZipCodeModelCopyWith<$Res> {
  _$ZipCodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipCode = null,
    Object? city = null,
  }) {
    return _then(_value.copyWith(
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ZipCodeModelImplCopyWith<$Res>
    implements $ZipCodeModelCopyWith<$Res> {
  factory _$$ZipCodeModelImplCopyWith(
          _$ZipCodeModelImpl value, $Res Function(_$ZipCodeModelImpl) then) =
      __$$ZipCodeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'kod') String zipCode,
      @JsonKey(name: 'miejscowosc') String city});
}

/// @nodoc
class __$$ZipCodeModelImplCopyWithImpl<$Res>
    extends _$ZipCodeModelCopyWithImpl<$Res, _$ZipCodeModelImpl>
    implements _$$ZipCodeModelImplCopyWith<$Res> {
  __$$ZipCodeModelImplCopyWithImpl(
      _$ZipCodeModelImpl _value, $Res Function(_$ZipCodeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipCode = null,
    Object? city = null,
  }) {
    return _then(_$ZipCodeModelImpl(
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ZipCodeModelImpl implements _ZipCodeModel {
  _$ZipCodeModelImpl(
      {@JsonKey(name: 'kod') required this.zipCode,
      @JsonKey(name: 'miejscowosc') required this.city});

  factory _$ZipCodeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZipCodeModelImplFromJson(json);

  @override
  @JsonKey(name: 'kod')
  final String zipCode;
  @override
  @JsonKey(name: 'miejscowosc')
  final String city;

  @override
  String toString() {
    return 'ZipCodeModel(zipCode: $zipCode, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZipCodeModelImpl &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, zipCode, city);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZipCodeModelImplCopyWith<_$ZipCodeModelImpl> get copyWith =>
      __$$ZipCodeModelImplCopyWithImpl<_$ZipCodeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZipCodeModelImplToJson(
      this,
    );
  }
}

abstract class _ZipCodeModel implements ZipCodeModel {
  factory _ZipCodeModel(
          {@JsonKey(name: 'kod') required final String zipCode,
          @JsonKey(name: 'miejscowosc') required final String city}) =
      _$ZipCodeModelImpl;

  factory _ZipCodeModel.fromJson(Map<String, dynamic> json) =
      _$ZipCodeModelImpl.fromJson;

  @override
  @JsonKey(name: 'kod')
  String get zipCode;
  @override
  @JsonKey(name: 'miejscowosc')
  String get city;
  @override
  @JsonKey(ignore: true)
  _$$ZipCodeModelImplCopyWith<_$ZipCodeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
