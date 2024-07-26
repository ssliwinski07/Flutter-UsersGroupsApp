import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_service_base.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/models/models.dart';

class DatabaseServiceMain implements DatabaseServiceBase {
  @override
  Future<Database> initilizeDatabase() async {
    final Future<Database> db = openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $usersTable(id INTEGER PRIMARY KEY, name TEXT, lastName TEXT, phoneNumber TEXT);CREATE TABLE $usersGroupsTable(id INTEGER PRIMARY KEY, name TEXT)',
        );
        await db.execute(
          'CREATE TABLE $usersGroupsTable(id INTEGER PRIMARY KEY, name TEXT)',
        );
      },
      version: 1,
    );

    return db;
  }

  @override
  Future<void> dropDatabase() async {
    final String path = await getDatabasesPath();
    final String dbPath = join(path, databaseName);

    await deleteDatabase(dbPath);
    print("Database deleted: $dbPath");
  }

  @override
  Future<void> insertToDatabase(
      {required Map<String, dynamic> json, required String tableName}) async {
    final db = await initilizeDatabase();

    await db.insert(tableName, json,
        conflictAlgorithm: ConflictAlgorithm.replace);

    await db.close();
  }

  @override
  Future<List<T>> getDataFromDatabase<T>({
    required String table,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final Database db = await initilizeDatabase();
    final List<Map<String, dynamic>> dataMap = await db.query(table);

    return dataMap.map((e) => fromJson(e)).toList();
  }
}
