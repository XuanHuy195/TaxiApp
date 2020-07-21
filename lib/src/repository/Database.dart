import 'package:TaxiApp/src/repository/Info_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RegisterDatabase {
  static const DB_NAME = "Info.db";
  static const DB_VERSION = 1;
  static Database _database;

  RegisterDatabase._internal();
  static final RegisterDatabase instance = RegisterDatabase._internal();

  Database get databse => _database;

  static const initScripts = [InfoTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [InfoTable.CREATE_TABLE_QUERY];

  init() async {
    _database = await openDatabase(join(await getDatabasesPath(), DB_NAME),
        onCreate: (db, version) {
      initScripts.forEach((script) async => await db.execute(script));
    }, onUpgrade: (db, oldVersion, newVersion) {
      initScripts.forEach((script) async => await db.execute(script));
    }, version: DB_VERSION);
  }
}
