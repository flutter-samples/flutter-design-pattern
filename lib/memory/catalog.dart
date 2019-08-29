import 'package:flutter/material.dart';
import 'package:shopper/models/catalog.dart';
import 'package:shopper/file/catalog.dart';
import 'dart:math';

class CatalogMemory {
  CatalogMemory() {
    initCatalogs();
  }
  Future<List> initCatalogs() async {
    catalogList.clear();
    Catalog cat1 = Catalog.fromJson(json1);
    Catalog cat2 = Catalog.fromJson(json2);
    catalogList.add(cat1);
    catalogList.add(cat2);
    return catalogList;
  }

  Future<List> getCatalogs() async {
    return catalogList;
  }

  Future<Catalog> addCatalog() async {
    var rand = Random();

    Map<String, dynamic> randomJson = {
      "id": catalogList.length + 1,
      "name": catalogNames[catalogList.length % catalogNames.length],
      "color": Colors.primaries[catalogList.length % Colors.primaries.length],
      "price": rand.nextInt(100)
    };
    Catalog randomCatalog = Catalog.fromJson(randomJson);
    catalogList.add(randomCatalog);
    return randomCatalog;
  }

  Future<List> clearCatalogs() async {
    catalogList.clear();
    return catalogList;
  }
}
