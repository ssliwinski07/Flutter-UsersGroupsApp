import 'package:flutter_users_group_app/models/models.dart';
import 'package:flutter_users_group_app/models/user/user_model.dart';
import 'package:flutter_users_group_app/models/user/user_with_group_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_service_base.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';

class DatabaseServiceMain implements DatabaseServiceBase {
  @override
  Future<Database> initilizeDatabase() async {
    final Future<Database> db = openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $usersTable(
            userId INTEGER PRIMARY KEY, 
            userName TEXT, 
            lastName TEXT, 
            streetName TEXT,
            postalCode TEXT,
            cityName TEXT
            )''',
        );
        await db.execute(
          '''CREATE TABLE $groupsTable(
          groupId INTEGER PRIMARY KEY, 
          groupName TEXT)''',
        );
        await db.execute(
          '''CREATE TABLE $usersGroupsTable(
              userId INTEGER, 
              groupId INTEGER, 
              PRIMARY KEY (userId, groupId),
              FOREIGN KEY (userId) REFERENCES $usersTable (id),
              FOREIGN KEY (groupId) REFERENCES $groupsTable (id)  
              )''',
        );
      },
      version: 1,
    );

    return db;
  }

  @override
  Future<bool> dropDatabase() async {
    final String path = await getDatabasesPath();
    final String dbPath = join(path, databaseName);

    try {
      await deleteDatabase(dbPath);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<int> insertToDatabase(
      {required Map<String, dynamic> json, required String tableName}) async {
    final db = await initilizeDatabase();

    final id = await db.insert(tableName, json,
        conflictAlgorithm: ConflictAlgorithm.replace);

    await db.close();

    return id;
  }

  @override
  Future<List<T>> getDataFromTable<T>({
    required String table,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final Database db = await initilizeDatabase();
    final List<Map<String, dynamic>> dataMap = await db.query(table);

    return dataMap.map((e) => fromJson(e)).toList();
  }

  @override
  Future<List<UserWithGroupModel>> getUsersWithGroup() async {
    const query = ''' SELECT
    $usersTable.userId,
    $usersTable.userName,
    $usersTable.lastName,
    $usersTable.streetName,
    $usersTable.postalCode,
    $usersTable.cityName,
    $groupsTable.groupId,
    $groupsTable.groupName
    FROM $usersTable
    JOIN $usersGroupsTable ON $usersGroupsTable.userId = $usersTable.userId
    JOIN $groupsTable ON $groupsTable.groupId = $usersGroupsTable.groupId
    ''';

    final data = await _getDataFromQuery(
        query: query,
        fromJson: (e) => UserWithGroupModel(
              user: UserModel.fromJson(e),
              group: GroupModel.fromJson(e),
            ));

    return data;
  }

  @override
  Future<List<UserModel>> getUsersForGroup({required int groupId}) async {
    String query = ''' SELECT
    $usersTable.userId,
    $usersTable.userName,
    $usersTable.lastName,
    $usersTable.streetName,
    $usersTable.postalCode,
    $usersTable.cityName
    FROM $usersTable
    JOIN $usersGroupsTable ON $usersGroupsTable.userId = $usersTable.userId
    JOIN $groupsTable ON $groupsTable.groupId = $usersGroupsTable.groupId
    WHERE $groupsTable.groupId = $groupId
    ''';

    final data = await _getDataFromQuery(
        query: query, fromJson: (e) => UserModel.fromJson(e));

    return data;
  }

  Future<List<T>> _getDataFromQuery<T>({
    required String query,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final Database db = await initilizeDatabase();
    final List<Map<String, dynamic>> dataMap = await db.rawQuery(query);

    return dataMap.map(
      (e) {
        return fromJson(e);
      },
    ).toList();
  }
}
