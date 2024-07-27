import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_address_model.freezed.dart';
part 'user_address_model.g.dart';

@freezed
class UserAddressModel with _$UserAddressModel {
  factory UserAddressModel({
    required String streetName,
    required String postalCode,
    required String cityName,
  }) = _UserAddressModel;

  factory UserAddressModel.fromJson(Map<String, Object?> json) =>
      _$UserAddressModelFromJson(json);
}
