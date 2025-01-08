import 'package:get_it/get_it.dart';

import 'package:flutter_users_group_app/helpers/constans/constans.dart';
import 'package:flutter_users_group_app/core/core.dart';

class ServiceLocator {
  GetIt get getInstance => GetIt.instance;
  DatabaseServiceBase get databaseServiceBase => _networkDatabaseService;
  ZipCodesNetworkServiceBase get zipCodesNetworkServiceBase =>
      _zipCodesNetworkServiceBase;

  late final DatabaseServiceBase _networkDatabaseService;
  late final ZipCodesNetworkServiceBase _zipCodesNetworkServiceBase;

  //Core services
  Future<void> initializeCoreServices() async {
    //database service init
    final databaseService = DatabaseServiceMain();
    await databaseService.initilizeDatabase();
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
  Future<void> initializeUiServices() async {
    //message service init
    final messageService = MessageInfoServiceUi();
    getInstance.registerSingleton<MessageInfoServiceBase>(
      messageService,
      instanceName: mainInstance,
    );
  }

  Future<void> initServices() async {
    await initializeCoreServices();
    await initializeUiServices();
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
