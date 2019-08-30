import 'package:flutter/foundation.dart';
import 'package:shopper/models/catalog.dart';

class CartController with ChangeNotifier {
  List<Catalog> _itemIds;

  CartController() {
    init();
  }

  List<Catalog> get items => _itemIds;

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void init() {
    _itemIds = [];
  }

  add(Catalog catalog) {
    _itemIds.add(catalog);
    notifyListeners();
  }

  remove(Catalog catalog) {
    _itemIds.removeWhere((item) => item.id == catalog.id);
    notifyListeners();
  }

  clear() {
    _itemIds.clear();
    notifyListeners();
  }

  contains(id) {
    return _itemIds
        .map((item) {
          return item.id;
        })
        .toList()
        .contains(id);
  }
}
