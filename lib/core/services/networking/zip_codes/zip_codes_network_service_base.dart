import 'package:flutter_users_group_app/models/models.dart';

abstract interface class ZipCodesNetworkServiceBase {
  Future<List<String>> getZipCodes({required String cityName});
  Future<List<ZipCodeModel>> getZipCodeInfo({required String zipCode});
}
