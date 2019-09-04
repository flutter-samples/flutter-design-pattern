import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/controllers/cart.dart';
import 'package:shopper/controllers/catalog.dart';
import 'package:shopper/views/cart.dart';
import 'package:shopper/views/catalog.dart';
import 'package:shopper/views/order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => CatalogController(),
          child: ShopCatalog(),
        ),
        ChangeNotifierProvider(
          builder: (_) => CartController(),
          child: ShopCart(),
        ),
      ],
      child: MaterialApp(
        title: 'Shopper',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => ShopCatalog(),
          '/cart': (context) => ShopCart(),
          '/order': (context) => ShopOrder(),
        },
      ),
    );
  }
}
