import 'package:dio/dio.dart';

abstract interface class NetworkingServiceBase {
  Dio createDio();
}
