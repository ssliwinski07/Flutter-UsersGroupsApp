import 'package:sqflite/sqflite.dart';

import 'package:flutter_users_group_app/models/models.dart';

abstract interface class DatabaseServiceBase {
  Future<Database> initilizeDatabase();
  Future<int> insertToDatabase({
    required Map<String, dynamic> json,
    required String tableName,
  });
  Future<bool> dropDatabase();
  Future<List<UserWithGroupModel>> getUsersWithGroup();
  Future<List<UserModel>> getUsersForGroup({required int groupId});
  Future<List<GroupModel>> getUsersGroups();
  Future<void> deleteUser({required int userId});
  Future<void> deleteGroup({required int groupId});
  Future<List<UserGroupModel>> getUsersAndGroups();
  Future<List<UserModel>> getUsers();
}
