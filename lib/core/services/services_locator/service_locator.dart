import 'package:get_it/get_it.dart';

import 'package:flutter_users_group_app/helpers/constans/constans.dart';
import 'package:flutter_users_group_app/core/core.dart';

class ServiceLocator {
  GetIt get getInstance => GetIt.instance;

  Future<void> setupServiceLocators() async {
    await _initializeCoreServices();
    await _initializeUiServices();
  }

  Future<void> setupDependencies() async {
    await GetServices().databaseServiceBase.openDb();
  }

  //Core services
  Future<void> _initializeCoreServices() async {
    //database service init
    final databaseService = DatabaseServiceMain();
    getInstance.registerSingleton<DatabaseServiceBase>(
      databaseService,
      instanceName: mainInstance,
    );

    //networking service init
    final networkingService = NetworkingServiceMain();
    getInstance.registerSingleton<NetworkingServiceBase>(
      networkingService,
      instanceName: mainInstance,
    );

    //fetching zipcodes service init
    final zipCodesService =
        ZipCodesNetworkServiceMain(networkingService.dioClient);
    getInstance.registerSingleton<ZipCodesNetworkServiceBase>(
      zipCodesService,
      instanceName: mainInstance,
    );
  }

  //UI services
  Future<void> _initializeUiServices() async {
    //message service init
    final messageService = MessageInfoServiceUi();
    getInstance.registerSingleton<MessageInfoServiceBase>(
      messageService,
      instanceName: mainInstance,
    );
  }
}

class GetServices {
  GetServices._() {
    final serviceLocator = ServiceLocator();

    _databaseServiceBase = serviceLocator.getInstance<DatabaseServiceBase>(
        instanceName: mainInstance);
    _zipCodesNetworkServiceBase = serviceLocator
        .getInstance<ZipCodesNetworkServiceBase>(instanceName: mainInstance);
    _networkingServiceBase = serviceLocator.getInstance<NetworkingServiceBase>(
        instanceName: mainInstance);
    _messageInfoServiceBase = serviceLocator
        .getInstance<MessageInfoServiceBase>(instanceName: mainInstance);
  }

  factory GetServices() => _instance;
  static final GetServices _instance = GetServices._();

  DatabaseServiceBase get databaseServiceBase => _databaseServiceBase;
  ZipCodesNetworkServiceBase get zipCodesNetworkServiceBase =>
      _zipCodesNetworkServiceBase;
  NetworkingServiceBase get networkingServiceBase => _networkingServiceBase;
  MessageInfoServiceBase get messageInfoServiceBase => _messageInfoServiceBase;

  late final DatabaseServiceBase _databaseServiceBase;
  late final ZipCodesNetworkServiceBase _zipCodesNetworkServiceBase;
  late final NetworkingServiceBase _networkingServiceBase;
  late final MessageInfoServiceBase _messageInfoServiceBase;
}
