import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'package:flutter_users_group_app/core/services/services.dart';
import 'package:flutter_users_group_app/helpers/constans/constans.dart';

class ServiceLocator {
  GetIt get getInstance => GetIt.instance;
  Dio dio = Dio();

  //Core services
  Future<void> initializeCoreServices() async {
    getInstance.registerSingleton<DatabaseServiceBase>(
      DatabaseServiceMain(),
      instanceName: mainInstance,
    );
    getInstance.registerSingleton<ZipCodesServiceBase>(ZipCodesServiceMain(dio),
        instanceName: mainInstance);
  }

  //UI services
  Future<void> initializeUiServices() async {
    getInstance.registerSingleton<MessageInfoServiceBase>(
      MessageInfoServiceUi(),
      instanceName: mainInstance,
    );
  }
}
