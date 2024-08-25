import 'package:get_it/get_it.dart';

import 'package:flutter_users_group_app/core/services/services.dart';
import 'package:flutter_users_group_app/helpers/constans/constans.dart';

class ServiceLocator {
  GetIt get getInstance => GetIt.instance;

  //Core services
  Future<void> initializeCoreServices() async {
    getInstance.registerSingleton<DatabaseServiceBase>(
      DatabaseServiceMain(),
      instanceName: mainInstance,
    );
    getInstance.registerSingleton<NetworkingServiceBase>(
      NetworkingServiceMain(),
      instanceName: mainInstance,
    );

    final networkingSerivce = ServiceLocator()
        .getInstance<NetworkingServiceBase>(instanceName: mainInstance);

    getInstance.registerSingleton<ZipCodesNetworkServiceBase>(
        ZipCodesNetworkServiceMain(networkingSerivce.dioClient),
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
