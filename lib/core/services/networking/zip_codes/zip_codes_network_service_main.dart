import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/core/core.dart';

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
}
