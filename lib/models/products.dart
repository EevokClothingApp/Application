import 'package:flutter/material.dart';

class Product {
  
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final bool isFavorite;
  final String userEmail;
  final String userID;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      @required this.userEmail,
      @required this.userID,
      this.isFavorite = false});

}