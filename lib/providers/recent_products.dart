import 'package:application/widgets/horizontal_list_view.dart';
import 'package:application/widgets/image_slider.dart';
import 'package:application/providers/product.dart';
import 'package:application/providers/single_product.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RecentProducts extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference().child("products");

  List products = [
    //   Product(
    //     id: 'p1',
    //     title: 'Red Shirt',
    //     description: 'A red shirt - it is pretty red!',
    //     price: 29.99,
    //     imageURL:
    //         'https://www.leatherclue.com/image/cache/catalog/AB_TEES/Plain%20T/red-men-s-tshirt-550x550.jpg',
    //     prod_old_price: 50.0,
    //   ),
    //   Product(
    //     id: 'p2',
    //     title: 'Trousers',
    //     description: 'A nice pair of trousers.',
    //     price: 59.99,
    //     imageURL:
    //         'https://www.transparentpng.com/thumb/trouser/trouser-png-transparent-image--0.png',
    //     prod_old_price: 60.0,
    //   ),
    //   Product(
    //     id: 'p3',
    //     title: 'Red Blouse',
    //     description: 'A red shirt - it is pretty red!',
    //     price: 29.99,
    //     imageURL:
    //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    //     prod_old_price: 50.0,
    //   ),
    //   Product(
    //     id: 'p4',
    //     title: 'Red Pant',
    //     description: 'A red shirt - it is pretty red!',
    //     price: 29.99,
    //     imageURL:
    //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    //     prod_old_price: 50.0,
    //   ),
    //   Product(
    //     id: 'p5',
    //     title: 'Red Shirt',
    //     description: 'A red shirt - it is pretty red!',
    //     price: 29.99,
    //     imageURL:
    //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    //     prod_old_price: 50.0,
    //   ),
    //   Product(
    //     id: 'p6',
    //     title: 'Underware',
    //     description: 'A red shirt - it is pretty red!',
    //     price: 29.99,
    //     imageURL:
    //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    //     prod_old_price: 50.0,
    //   ),
  ];

  void getProducts() {
    FutureBuilder(
      future: dbRef.once(),
      builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
        if (snapshot.hasData) {
          products.clear();
          Map<dynamic, dynamic> values = snapshot.data.value;
          values.forEach((key, values) {
            products.add(values);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    return ListView(
      children: <Widget>[
        ImageSlider(),
        Container(
          color: Colors.pink[50],
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Categories',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        HorizontalListView(),
        SizedBox(
          height: 5.0,
        ),
        Container(
          color: Colors.pink[50],
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Recent Products',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          height: products.length * 80.0,
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, i) => SingleProduct(
              title: products[i]['name'],
              imageURL: products[i]['images'][0],
              prod_old_price: 00.00,
              price: products[i]['price'],
              id: products[i]['id'],
              description: products[i]["description"],
            ),
          ),
        ),
      ],
    );
  }
}
