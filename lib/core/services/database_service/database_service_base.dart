import 'package:sqflite/sqflite.dart';

import 'package:flutter_users_group_app/models/models.dart';

abstract interface class DatabaseServiceBase {
  Future<Database> initilizeDatabase();
  Future<int> insertToDatabase(
      {required Map<String, dynamic> json, required String tableName});
  Future<List<T>> getDataFromTable<T>({
    required String table,
    required T Function(Map<String, dynamic>) fromJson,
  });
  Future<bool> dropDatabase();
  Future<List<UserWithGroupModel>> getUsersWithGroup();
  Future<List<UserModel>> getUsersForGroup({required int groupId});
}
