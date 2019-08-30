import 'dart:async';
import 'package:shopper/db/sqlite.dart';
import 'package:shopper/models/catalog.dart';
import 'package:shopper/utils/helps.dart';

class CatalogDriver {
  final dbProvider = DatabaseProvider.dbProvider;
  static final String database = 'shopper.db';
  static final String tableCatalog = 'catalog';

  CatalogDriver() {
    initCatalogs();
  }
  Future initCatalogs() async {
    await clearCatalogs();
  }

  Future<int> addCatalog() async {
    final db = await dbProvider.database;
    int total = await getTotal();
    Map<String, dynamic> randomJson = Helper.makeRandCatalog(total);
    var result = await db.insert(tableCatalog, randomJson);
    return result;
  }

  Future<List> getCatalogs() async {
    final db = await dbProvider.database;
    var catalogList = List<Catalog>();
    List<Map> result = await db.query(tableCatalog);
    catalogList = result.map((item) => Catalog.fromJson(item)).toList();
    return catalogList;
  }

  Future<int> getTotal() async {
    final db = await dbProvider.database;
    var result =
        await db.rawQuery("SELECT COUNT(id) as Total FROM $tableCatalog");
    return result[0]['Total'];
  }

  Future clearCatalogs() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      tableCatalog,
    );
    return result;
  }
}
