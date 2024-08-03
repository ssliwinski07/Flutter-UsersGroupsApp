import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'package:flutter_users_group_app/helpers/helpers.dart';

class ResponseFormatInterceptor extends Interceptor {
  ResponseFormatInterceptor({
    required this.responseFormat,
  });

  final String responseFormat;

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final logger = Logger();
    response.headers.add(acceptHeader, responseFormat);
    logger.i("Response: ${response.data}, EXTRAS: ${response.headers}");

    return handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    return handler.next(err);
  }
}
