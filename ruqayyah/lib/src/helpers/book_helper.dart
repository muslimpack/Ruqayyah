import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:ruqayyah/src/models/rukia.dart';
import 'package:ruqayyah/src/shared/functions/app_print.dart';
import 'package:sqflite/sqflite.dart';

RukiaDBHelper rukiaDBHelper = RukiaDBHelper();

class RukiaDBHelper {
  /* ************* Variables ************* */

  static const String dbName = "Ruqayyah.db";
  static const int dbVersion = 2;

  /* ************* Singleton Constructor ************* */

  static RukiaDBHelper? _instance;
  static Database? _database;

  factory RukiaDBHelper() {
    _instance ??= RukiaDBHelper._createInstance();
    return _instance!;
  }

  RukiaDBHelper._createInstance();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  /* ************* Database Creation ************* */

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    final exist = await databaseExists(path);

    //Check if database is already in that Directory
    if (!exist) {
      // Database isn't exist > Create new Database
      await _copyFromAssets(path: path);
    }

    Database database = await openDatabase(path);

    await database.getVersion().then((currentVersion) async {
      if (currentVersion < dbVersion) {
        appPrint("[DB] New Version Detected");
        database.close();

        //delete the old database so you can copy the new one
        await deleteDatabase(path);

        // Database isn't exist > Create new Database
        await _copyFromAssets(path: path);
      }
    });

    return database = await openDatabase(
      path,
      version: dbVersion,
      onCreate: _onCreateDatabase,
      onUpgrade: _onUpgradeDatabase,
      onDowngrade: _onDowngradeDatabase,
    );
  }

  FutureOr<void> _onCreateDatabase(Database db, int version) async {}

  FutureOr<void> _onUpgradeDatabase(
    Database db,
    int oldVersion,
    int newVersion,
  ) {}

  FutureOr<void> _onDowngradeDatabase(
    Database db,
    int oldVersion,
    int newVersion,
  ) {}

  FutureOr<void> _copyFromAssets({required String path}) async {
    try {
      await Directory(dirname(path)).create(recursive: true);

      final ByteData data = await rootBundle.load(join("assets", "db", dbName));
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } catch (e) {
      appPrint(e.toString());
    }
  }

  Future<List<Rukia>> getAll() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('book');

    return List.generate(maps.length, (i) {
      return Rukia.fromMap(maps[i]);
    });
  }

  /// Close database
  Future close() async {
    final db = await database;
    db.close();
  }
}
