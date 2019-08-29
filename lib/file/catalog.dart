import 'package:flutter/material.dart';
import 'package:shopper/models/catalog.dart';

List<Catalog> catalogList = List<Catalog>();
Map<String, dynamic> json1 = {
  "id": 1,
  "name": "Spaghetti",
  "color": Colors.red,
  "price": 43
};
Map<String, dynamic> json2 = {
  "id": 2,
  "name": "Automata",
  "color": Colors.blue,
  "price": 34
};

const catalogNames = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];
