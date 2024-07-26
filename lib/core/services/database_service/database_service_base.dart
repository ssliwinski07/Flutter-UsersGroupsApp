import 'package:sqflite/sqflite.dart';

abstract interface class DatabaseServiceBase {
  Future<Database> initilizeDatabase();
  Future<void> insertToDatabase(
      {required Map<String, dynamic> json, required String tableName});
  Future<List<T>> getDataFromDatabase<T>(
      {required String table,
      required T Function(Map<String, dynamic>) fromJson});
  Future<bool> dropDatabase();
}
