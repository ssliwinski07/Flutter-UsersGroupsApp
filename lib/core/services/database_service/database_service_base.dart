import 'package:sqflite/sqflite.dart';

abstract interface class DatabaseServiceBase {
  Future<Database> initilizeDatabase();
  Future<int> insertToDatabase(
      {required Map<String, dynamic> json, required String tableName});
  Future<List<T>> getDataFromTable<T>({
    required String table,
    required T Function(Map<String, dynamic>) fromJson,
  });
  Future<bool> dropDatabase();
  Future<List<T>> getDataFromQuery<T>({
    required String query,
    required T Function(Map<String, dynamic>) fromJson,
  });
}
