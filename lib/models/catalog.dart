import 'package:flutter/material.dart';

@immutable
class Catalog {
  final int id;
  final String name;
  final int color;
  final int price;

  Catalog(this.id, this.name, this.color, this.price);

  Catalog.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        color = json['color'],
        price = json['price'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'color': color,
        'price': price,
      };
}
