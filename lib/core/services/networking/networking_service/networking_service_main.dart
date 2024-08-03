import 'package:dio/dio.dart';

import 'package:flutter_users_group_app/core/core.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';

class NetworkingServiceMain implements NetworkingServiceBase {
  NetworkingServiceMain() {
    createDio();
  }

  @override
  Dio createDio() {
    final dioClient = Dio();

    dioClient.options = BaseOptions(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
    );

    dioClient.interceptors
        .add(ResponseFormatInterceptor(responseFormat: acceptHeaderJsonValue));

    return dioClient;
  }
}
