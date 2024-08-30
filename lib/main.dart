import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helpers/helpers.dart';
import 'core/core.dart';
import 'mobx/stores/stores.dart';
import 'routes/routes.dart';
import 'cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serviceLocator = ServiceLocator();

  Future<void> initServices() async {
    await serviceLocator.initializeCoreServices();
    await serviceLocator.initializeUiServices();
  }

  await initServices();

  DatabaseServiceBase databaseServiceBase = serviceLocator
      .getInstance<DatabaseServiceBase>(instanceName: mainInstance);

  ZipCodesNetworkServiceBase zipCodesNetworkServiceBase = serviceLocator
      .getInstance<ZipCodesNetworkServiceBase>(instanceName: mainInstance);

  await databaseServiceBase.initilizeDatabase();

  runApp(
    MultiBlocProvider(
      providers: [
        Provider<UsersStore>(
          create: (context) => UsersStore(
            databaseService: databaseServiceBase,
            zipCodesNetworkServiceBase: zipCodesNetworkServiceBase,
          ),
        ),
        Provider<GroupsStore>(
          create: (context) =>
              GroupsStore(databaseService: databaseServiceBase),
        ),
        Provider<SettingsStore>(
          create: (context) =>
              SettingsStore(databaseServiceBase: databaseServiceBase),
        ),
        BlocProvider<UsersCubit>(
          create: (context) => UsersCubit(
            zipCodeService: zipCodesNetworkServiceBase,
          ),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SettingsStore settingsStore =
        Provider.of<SettingsStore>(context, listen: false);

    return Observer(
      builder: (_) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _appRouter.router,
        locale: Locale(settingsStore.locale ?? pl),
      ),
    );
  }
}
