import 'package:TaxiApp/src/model/Info.dart';
import 'package:TaxiApp/src/repository/Database.dart';
import 'package:sqflite/sqflite.dart';

class InfoTable {
  static const TABLE_NAME = "info";

  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE $TABLE_NAME(
        id INTERGER PRIMARY KEY,
        name TEXT,
        phone TEXT,
        email TEXT,
        password TEXT,
    );
  ''';

  static const DROP_TABLE_QUERY = '''
      DROP TABLE IF EXISTS $TABLE_NAME
  ''';

  Future<void> insertInfo(Info info) {
    final Database db = RegisterDatabase.instance.databse;
    return db.insert(
      TABLE_NAME,
      info.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteInfo(Info info) async {
    final Database db = RegisterDatabase.instance.databse;
    await db.delete(
      TABLE_NAME,
      where: 'id= ?',
      whereArgs: [info.id],
    );
  }

  Future<List<Info>> selectALLInfo() async {
    final Database db = RegisterDatabase.instance.databse;
    final List<Map<String, dynamic>> maps = await db.query('info');

    return List.generate(maps.length, (index) {
      return Info.fromData(
        maps[index]['id'],
        maps[index]['name'],
        maps[index]['phone'],
        maps[index]['email'],
        maps[index]['password'],
      );
    });
  }
}
