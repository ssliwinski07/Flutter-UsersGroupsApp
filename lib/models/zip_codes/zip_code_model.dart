// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'zip_code_model.freezed.dart';
part 'zip_code_model.g.dart';

@freezed
class ZipCodeModel with _$ZipCodeModel {
  factory ZipCodeModel({
    @JsonKey(name: 'kod') required String zipCode,
    @JsonKey(name: 'miejscowosc') required String city,
  }) = _ZipCodeModel;

  factory ZipCodeModel.fromJson(Map<String, Object?> json) =>
      _$ZipCodeModelFromJson(json);
}
