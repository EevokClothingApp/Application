import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String imageURL;
  final String description;
  final double prod_old_price;
  final double price;

  Product(
      {@required this.title,
      @required this.imageURL,
      @required this.prod_old_price,
      @required this.price,
      @required this.id,
      @required this.description});

}
