import 'package:shopper/memory/catalog.dart';

class CatalogRepository {
  final _catalogFile = CatalogMemory();

  Future getCatalogs({String query}) {
    return _catalogFile.getCatalogs();
  }

  Future addCatalog() {
    return _catalogFile.addCatalog();
  }

  Future clearCatalogs() {
    return _catalogFile.clearCatalogs();
  }
}
