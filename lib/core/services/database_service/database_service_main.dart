import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_service_base.dart';
import 'package:flutter_users_group_app/helpers/helpers.dart';
import 'package:flutter_users_group_app/models/models.dart';

class DatabaseServiceMain implements DatabaseServiceBase {
  @override
  Future<Database> initilizeDatabase() async {
    final db = openDatabase(
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
        await db.execute(
          '''CREATE TABLE $settingsTable(
              settingId INTEGER PRIMARY KEY,
              settingName TEXT,
              settingValue TEXT
            )''',
        );
        await db.execute(
          '''INSERT INTO $settingsTable (settingName, settingValue) 
              VALUES (?, ?) 
              ''',
          ['UserLanguage', 'en'],
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

    final data = await _getListDataFromQuery(
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
    WHERE $groupsTable.groupId = ?
    ''';

    final data = await _getListDataFromQuery(
      query: query,
      parameters: [groupId],
      fromJson: (e) => UserModel.fromJson(e),
    );

    return data;
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final data = await _getDataFromTable(
        table: usersTable, fromJson: (e) => UserModel.fromJson(e));

    return data;
  }

  @override
  Future<SettingsModel> getSettingValue({
    required String settingsTable,
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final data = await _getSingleDataFromTable(
        table: settingsTable,
        where: where,
        whereArgs: whereArgs,
        fromJson: (e) => SettingsModel.fromJson(e));

    return data;
  }

  @override
  Future<int> updateSettingValue(
      {required String query, List<Object?>? parameters}) async {
    final data = await _updateTableFromQuery(
      query: query,
      parameters: parameters,
    );

    return data;
  }

  @override
  Future<GroupModel> getUserGroup({required int userId}) async {
    String query = ''' SELECT 
    $groupsTable.groupid,
    $groupsTable.groupName 
    FROM $groupsTable
    JOIN $usersGroupsTable ON $usersGroupsTable.groupId = $groupsTable.groupId
    JOIN $usersTable ON $usersTable.userId = $usersGroupsTable.userId
    WHERE $usersGroupsTable.userId = ?
    ''';

    final data = await _getDataFromQuery(
      query: query,
      parameters: [userId],
      fromJson: (e) => GroupModel.fromJson(e),
    );

    return data;
  }

  @override
  Future<List<GroupModel>> getUsersGroups() async {
    final data = await _getDataFromTable(
        table: groupsTable, fromJson: (e) => GroupModel.fromJson(e));

    return data;
  }

  //delete it later, won't be needed in prod ;)
  @override
  Future<List<UserGroupModel>> getUsersAndGroups() async {
    final data = await _getDataFromTable(
        table: usersGroupsTable, fromJson: (e) => UserGroupModel.fromJson(e));

    return data;
  }

  @override
  Future<void> deleteUser({required int userId}) async {
    String deleteFromUsersTable = 'DELETE FROM $usersTable WHERE userId = ?';
    String deleteFromUsersGroupsTable =
        'DELETE FROM $usersGroupsTable WHERE userId = ?';

    Map<String, List<dynamic>> queries = {
      deleteFromUsersTable: [userId],
      deleteFromUsersGroupsTable: [userId],
    };

    await _deleteDataFromBatchQueries(
      queries: queries,
    );
  }

  @override
  Future<void> deleteGroup({required int groupId}) async {
    String deleteFromGroupsTable = 'DELETE FROM $groupsTable WHERE groupId = ?';
    String deleteFromUsersGroupsTable =
        'DELETE FROM $usersGroupsTable WHERE groupId = ?';

    Map<String, List<dynamic>> queries = {
      deleteFromGroupsTable: [groupId],
      deleteFromUsersGroupsTable: [groupId],
    };

    await _deleteDataFromBatchQueries(
      queries: queries,
    );
  }

  @override
  Future<int> addGroup({required Map<String, dynamic> groupJson}) async {
    final result = await _addToTable(json: groupJson, tableName: groupsTable);

    return result;
  }

  @override
  Future<void> addUser({
    required Map<String, dynamic> userJson,
    required int groupId,
  }) async {
    String query =
        '''INSERT INTO $usersGroupsTable(userId, groupId) VALUES(?,?)''';

    final result = await _addToTable(json: userJson, tableName: usersTable);

    await _addToTableFromQuery(query: query, parameters: [result, groupId]);
  }

  Future<void> _deleteDataFromBatchQueries({
    required Map<String, List<dynamic>> queries,
    bool continueOnError = true,
  }) async {
    final db = await initilizeDatabase();
    final batch = db.batch();

    for (var entry in queries.entries) {
      batch.rawDelete(entry.key, entry.value);
    }

    await batch.commit(noResult: true, continueOnError: continueOnError);

    await db.close();
  }

  //probably can be deleted
  Future<int> _deleteDataFromQuery({
    required String query,
    List<Object?>? parameters,
  }) async {
    final Database db = await initilizeDatabase();

    final result = await db.rawDelete(query, parameters);

    await db.close();

    return result;
  }

  Future<List<T>> _getListDataFromQuery<T>({
    required String query,
    List<Object?>? parameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final Database db = await initilizeDatabase();
    final List<Map<String, dynamic>> dataMap =
        await db.rawQuery(query, parameters);

    await db.close();

    return dataMap.map(
      (e) {
        return fromJson(e);
      },
    ).toList();
  }

  Future<T> _getDataFromQuery<T>({
    required String query,
    List<Object?>? parameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final Database db = await initilizeDatabase();
    List<Map<String, dynamic>> dataMap = await db.rawQuery(query, parameters);

    await db.close();

    return fromJson(dataMap.first);
  }

  Future<T> _getSingleDataFromTable<T>(
      {required String table,
      required T Function(Map<String, dynamic>) fromJson,
      String? where,
      List<Object?>? whereArgs}) async {
    final Database db = await initilizeDatabase();
    final List<Map<String, dynamic>> dataMap = await db.query(
      table,
      where: where,
      whereArgs: whereArgs,
    );

    await db.close();

    return fromJson(dataMap.first);
  }

  Future<List<T>> _getDataFromTable<T>(
      {required String table,
      required T Function(Map<String, dynamic>) fromJson,
      String? where,
      List<Object?>? whereArgs}) async {
    final Database db = await initilizeDatabase();
    final List<Map<String, dynamic>> dataMap = await db.query(
      table,
      where: where,
      whereArgs: whereArgs,
    );

    await db.close();

    return dataMap.map((e) => fromJson(e)).toList();
  }

  Future<int> _addToTable(
      {required Map<String, dynamic> json, required String tableName}) async {
    final db = await initilizeDatabase();

    final result = await db.insert(tableName, json,
        conflictAlgorithm: ConflictAlgorithm.replace);

    await db.close();

    return result;
  }

  Future<int> _updateTableFromQuery(
      {required String query, List<Object?>? parameters}) async {
    final db = await initilizeDatabase();

    final result = await db.rawUpdate(
      query,
      parameters,
    );

    await db.close();

    return result;
  }

  Future<int> _addToTableFromQuery({
    required String query,
    List<Object?>? parameters,
  }) async {
    final db = await initilizeDatabase();

    final result = await db.rawInsert(query, parameters);

    await db.close();

    return result;
  }
}
