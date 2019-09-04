import 'package:flutter/material.dart';
import 'package:shopper/repositories/catalog.dart';
import 'package:shopper/models/catalog.dart';
import 'dart:async';

class CatalogController with ChangeNotifier {
  final _catalogRepository = CatalogRepository();
  List<Catalog> _items = [];
  List<Catalog> get catalogs => _items;

  CatalogController() {
    init();
  }

  init() async {
    // initial sample data here.
    await addCatalog();
    await addCatalog();
    // end
    await getCatalogs();
  }

  Future getCatalogs() async {
    _items = await _catalogRepository.getCatalogs();
    notifyListeners();
  }

  Future addCatalog() async {
    await _catalogRepository.addCatalog();
    await getCatalogs();
    notifyListeners();
  }

  Future clearCatalogs() async {
    await _catalogRepository.clearCatalogs();
    await getCatalogs();
  }
}
