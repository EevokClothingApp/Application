import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;
  final String description;
  final double prod_old_price;
  final double price;

  SingleProduct(
      {@required this.title,
      @required this.imageURL,
      @required this.prod_old_price,
      @required this.price,
      @required this.id,
      @required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('data'),
    );
  }
}
