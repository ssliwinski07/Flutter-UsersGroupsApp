import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/core/core.dart';
import 'package:flutter_users_group_app/models/models.dart';

part 'zip_codes_network_service_main.g.dart';

@RestApi(baseUrl: zipCodesBaseApiUrl)
abstract class ZipCodesNetworkServiceMain
    implements ZipCodesNetworkServiceBase {
  factory ZipCodesNetworkServiceMain(Dio dio, {String baseUrl}) =
      _ZipCodesNetworkServiceMain;

  @override
  @GET('/city/{cityName}')
  Future<List<String>> getZipCodes({
    @Path('cityName') required String cityName,
  });

  @override
  @GET('/api/{zipCode}')
  Future<List<ZipCodeModel>> getZipCodeInfo({
    @Path('zipCode') required String zipCode,
  });
}
