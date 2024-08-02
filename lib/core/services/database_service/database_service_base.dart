import 'package:sqflite/sqflite.dart';

import 'package:flutter_users_group_app/models/models.dart';

abstract interface class DatabaseServiceBase {
  Future<Database> initilizeDatabase();
  Future<bool> dropDatabase();
  Future<List<UserModel>> getUsers();
  Future<GroupModel> getUserGroup({required int userId});
  Future<void> addUser(
      {required Map<String, dynamic> userJson, required int groupId});
  Future<void> deleteUser({required int userId});

  Future<List<GroupModel>> getUsersGroups();
  Future<List<UserModel>> getUsersForGroup({required int groupId});
  Future<int> addGroup({required Map<String, dynamic> groupJson});
  Future<void> deleteGroup({required int groupId});
  Future<int> updateGroup({
    required String groupName,
    required int groupId,
  });

  Future<SettingsModel> getSettingValue({
    required String settingsTable,
    String? where,
    List<Object?>? whereArgs,
  });
  Future<int> updateSettingValue(
      {required String query, List<Object?>? parameters});
}
