import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:shopper/driver/catalog.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, CatalogDriver.database);

    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  Future onUpgrade(Database database, int oldVersion, int newVersion) async {
    await database.execute("DROP TABLE ${CatalogDriver.tableCatalog}");
    await initDB(database, newVersion);
  }

  Future initDB(Database database, int version) async {
    return await database.execute("CREATE TABLE ${CatalogDriver.tableCatalog} ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT, "
        "color INTEGER, "
        "price INTEGER "
        ")");
  }
}
