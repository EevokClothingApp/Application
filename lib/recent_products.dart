import 'package:application/product.dart';
import 'package:application/single_product.dart';
import 'package:flutter/material.dart';

class RecentProducts extends StatelessWidget {
  List<Product> products = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageURL:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      prod_old_price: 50.0,
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageURL:
          'https://www.transparentpng.com/thumb/trouser/trouser-png-transparent-image--0.png',
      prod_old_price: 60.0,
    ),
    Product(
      id: 'p3',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageURL:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      prod_old_price: 50.0,
    ),
    Product(
      id: 'p4',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageURL:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      prod_old_price: 50.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: products.length*51.0,
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, i) => SingleProduct(
              title: products[i].title,
              imageURL: products[i].imageURL,
              prod_old_price: products[i].prod_old_price,
              price: products[i].price,
              id: products[i].id,
              description: products[i].description),
        ),
      ),
    );
  }
}
