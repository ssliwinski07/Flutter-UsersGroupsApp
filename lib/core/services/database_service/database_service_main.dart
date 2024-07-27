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
            id INTEGER PRIMARY KEY, 
            name TEXT, 
            lastName TEXT, 
            streetName TEXT,
            postalCode TEXT,
            cityName TEXT
            )''',
        );
        await db.execute(
          '''CREATE TABLE $groupsTable(
          id INTEGER PRIMARY KEY, 
          name TEXT)''',
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
}
