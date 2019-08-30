import 'package:shopper/driver/catalog.dart';
import 'package:shopper/memory/catalog.dart';

/// Do fetch data logic as you need here
const dataSource = 'memory';

class CatalogRepository {
  final _catalogDriver = CatalogDriver();
  final _catalogFile = CatalogMemory();

  Future getCatalogs({String query}) {
    switch (dataSource) {
      case 'memory':
        return _catalogFile.getCatalogs();
        break;
      case 'db':
        return _catalogDriver.getCatalogs();
        break;
      default:
        return _catalogFile.getCatalogs();
    }
  }

  Future addCatalog() {
    switch (dataSource) {
      case 'memory':
        return _catalogFile.addCatalog();
        break;
      case 'db':
        return _catalogDriver.addCatalog();
        break;
      default:
        return _catalogFile.addCatalog();
    }
  }

  Future clearCatalogs() {
    switch (dataSource) {
      case 'memory':
        return _catalogFile.clearCatalogs();
        break;
      case 'db':
        return _catalogDriver.clearCatalogs();
        break;
      default:
        return _catalogFile.clearCatalogs();
    }
  }
}
