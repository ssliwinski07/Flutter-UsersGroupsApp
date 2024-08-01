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
  //probably can be deleted later
  Future<List<UserWithGroupModel>> getUsersWithGroup();
  Future<List<GroupModel>> getUsersGroups();
  Future<List<UserModel>> getUsersForGroup({required int groupId});
  Future<int> addGroup({required Map<String, dynamic> groupJson});
  Future<void> deleteGroup({required int groupId});
  // delete it later, it's not neccessary ;)
  Future<List<UserGroupModel>> getUsersAndGroups();
  Future<SettingsModel> getSettingValue({
    required String settingsTable,
    String? where,
    List<Object?>? whereArgs,
  });
  Future<int> updateSettingValue(
      {required String query, List<Object?>? parameters});
}
