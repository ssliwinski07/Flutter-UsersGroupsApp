import 'package:mobx/mobx.dart';

import 'package:flutter_users_group_app/models/models.dart';
import 'package:flutter_users_group_app/core/core.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';

part 'settings_store.g.dart';

class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase with Store {
  SettingsStoreBase({
    required this.databaseServiceBase,
  });

  final DatabaseServiceBase databaseServiceBase;

  @observable
  String? locale;

  @action
  Future<void> getLocale() async {
    String where = 'settingName = ?';
    List<Object?>? whereArgs = ['UserLanguage'];

    final data = await _getSetting(where: where, whereArgs: whereArgs);
    locale = data.settingValue;
  }

  @action
  Future<void> updateLocale({required String value}) async {
    String query =
        '''UPDATE $settingsTable SET settingValue = ? WHERE settingName = 'UserLanguage' ''';

    await _updateSetting(query: query, parameters: [value]);
    await getLocale();
  }

  Future<int> _updateSetting(
      {required String query, List<Object?>? parameters}) async {
    final data = await databaseServiceBase.updateSettingValue(
        query: query, parameters: parameters);

    return data;
  }

  Future<SettingsModel> _getSetting({
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final data = await databaseServiceBase.getSettingValue(
        settingsTable: settingsTable, where: where, whereArgs: whereArgs);

    return data;
  }
}
