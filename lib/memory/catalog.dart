import 'package:shopper/models/catalog.dart';
import 'package:shopper/file/catalog.dart';
import 'package:shopper/utils/helps.dart';

class CatalogMemory {
  CatalogMemory() {
    initCatalogs();
  }
  Future initCatalogs() async {
    catalogList.clear();
    Catalog cat1 = Catalog.fromJson(json1);
    Catalog cat2 = Catalog.fromJson(json2);
    catalogList.add(cat1);
    catalogList.add(cat2);
  }

  Future<List> getCatalogs() async {
    return catalogList;
  }

  Future<int> addCatalog() async {
    Map<String, dynamic> randomJson = Helper.makeRandCatalog(
      catalogList.length,
    );
    Catalog randomCatalog = Catalog.fromJson(randomJson);
    catalogList.add(randomCatalog);
    return catalogList.length + 1;
  }

  Future clearCatalogs() async {
    var result = await catalogList.clear();
    return result;
  }
}
