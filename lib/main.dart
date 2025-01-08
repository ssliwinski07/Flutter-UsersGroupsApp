import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helpers/helpers.dart';
import 'core/core.dart';
import 'mobx/stores/stores.dart';
import 'routes/routes.dart';
import 'cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Handles the app exit - in that case it closes db while exiting the app.
  //Termination handled on Android and IOS. See 'AppDelegate.swift' and 'MainActivity.kt' files.
  _AppExitHandler.exitHandler();

  final serviceLocator = ServiceLocator();

  //setting up services
  await serviceLocator.setupServiceLocators();

  //setting up app dependencies
  await serviceLocator.setupDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        Provider<UsersStore>(
          create: (context) => UsersStore(
            databaseService: GetServices().databaseServiceBase,
            zipCodesNetworkServiceBase:
                GetServices().zipCodesNetworkServiceBase,
          ),
        ),
        Provider<GroupsStore>(
          create: (context) =>
              GroupsStore(databaseService: GetServices().databaseServiceBase),
        ),
        Provider<SettingsStore>(
          create: (context) => SettingsStore(
            databaseServiceBase: GetServices().databaseServiceBase,
          ),
        ),
        BlocProvider<UsersCubit>(
          create: (context) => UsersCubit(
            zipCodeService: GetServices().zipCodesNetworkServiceBase,
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

class _AppExitHandler {
  static const MethodChannel _channel = MethodChannel(appExitChannel);

  static void exitHandler() {
    _channel.setMethodCallHandler((h) async {
      if (h.method == onAppExit) {
        await GetServices().databaseServiceBase.dropDatabase();
      }
    });
  }
}
