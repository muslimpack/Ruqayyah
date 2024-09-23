import 'dart:async';

import 'package:ruqayyah/src/core/utils/db_helper.dart';
import 'package:ruqayyah/src/features/home/data/models/instruction.dart';
import 'package:ruqayyah/src/features/home/data/models/rukia.dart';
import 'package:sqflite/sqflite.dart';

class RukiaDBHelper {
  /* ************* Variables ************* */

  static const String dbName = "rukia.db";
  static const int dbVersion = 1;

  /* ************* Singleton Constructor ************* */

  static RukiaDBHelper? _instance;
  static Database? _database;
  static late final DBHelper _dbHelper;

  factory RukiaDBHelper() {
    _dbHelper = DBHelper(dbName: dbName, dbVersion: dbVersion);
    _instance ??= RukiaDBHelper._createInstance();
    return _instance!;
  }

  RukiaDBHelper._createInstance();

  Future<Database> get database async {
    _database ??= await _dbHelper.initDatabase();
    return _database!;
  }

  /* ************* Functions ************* */
  ///

  Future<List<Rukia>> getAllRukiaBook() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps =
        await db.rawQuery('SELECT * FROM book ORDER BY `order` ASC');

    return List.generate(maps.length, (i) {
      return Rukia.fromMap(maps[i]);
    });
  }

  Future<List<Instruction>> getAllInstructions() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps =
        await db.rawQuery('SELECT * FROM instructions ORDER BY `order` ASC');

    return List.generate(maps.length, (i) {
      return Instruction.fromMap(maps[i]);
    });
  }

  /// Close database
  Future close() async {
    final db = await database;
    db.close();
  }
}
