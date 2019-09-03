import 'package:shopper/repositories/catalog.dart';
import 'package:shopper/models/catalog.dart';
import 'dart:async';

class CatalogController {
  final _catalogRepository = CatalogRepository();
  final _catalogController = StreamController<List<Catalog>>.broadcast();

  Stream<List<Catalog>> get catalogs => _catalogController.stream;

  CatalogController() {
    init();
  }

  init() async {
    // initial sample data here.
    await addCatalog();
    await addCatalog();
    // end
    return getCatalogs();
  }

  Future getCatalogs() async {
    _catalogController.sink.add(
      await _catalogRepository.getCatalogs(),
    );
  }

  Future addCatalog() async {
    await _catalogRepository.addCatalog();
    await getCatalogs();
  }

  Future clearCatalogs() async {
    await _catalogRepository.clearCatalogs();
    await getCatalogs();
  }

  void dispose() {
    _catalogController.close();
  }
}
