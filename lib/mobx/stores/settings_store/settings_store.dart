import 'package:mobx/mobx.dart';

import 'package:flutter_users_group_app/models/models.dart';
import 'package:flutter_users_group_app/core/core.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';

part 'settings_store.g.dart';

class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase with Store {
  SettingsStoreBase({
    required this.databaseServiceBase,
  }) {
    _initializeStore();
  }

  final DatabaseServiceBase databaseServiceBase;

  @observable
  String? locale;

  @action
  Future<void> initializeLocale() async {
    String where = 'settingName = ?';
    List<Object?>? whereArgs = ['UserLanguage'];

    final data = await _getSetting(where: where, whereArgs: whereArgs);

    locale = data.settingValue;
  }

  Future<SettingsModel> _getSetting({
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final data = await databaseServiceBase.getSettingValue(
        settingsTable: settingsTable, where: where, whereArgs: whereArgs);

    return data;
  }

  void _initializeStore() {
    initializeLocale();
  }
}
