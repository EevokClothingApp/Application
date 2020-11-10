import 'package:application/widgets/horizontal_list_view.dart';
import 'package:application/widgets/image_slider.dart';
import 'package:application/providers/product.dart';
import 'package:application/providers/single_product.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecentProducts extends StatefulWidget {
  @override
  _RecentProductsState createState() => _RecentProductsState();
}

class _RecentProductsState extends State<RecentProducts> {
  Firestore _firestore = Firestore.instance;
  List temp = [];

  Future getDocs() async {
    temp.clear();
    temp = await _firestore.collection("products").getDocuments().then((value) {
      return value.documents;
    });

    for (int i = 0; i < temp.length; i++) {
      products.add(Product(
        id: temp[i]['id'],
        title: temp[i]['name'],
        description: temp[i]['description'],
        price: temp[i]['price'],
        imageURL:
            temp[i]['images'][0],
        prod_old_price: 50.0,
      ));
      print(temp[i]['brand']); //change these
    }
    setState(() {});
  }

  List products = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageURL:
          'https://www.leatherclue.com/image/cache/catalog/AB_TEES/Plain%20T/red-men-s-tshirt-550x550.jpg',
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
      title: 'Red Blouse',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageURL:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      prod_old_price: 50.0,
    ),
    Product(
      id: 'p4',
      title: 'Red Pant',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageURL:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      prod_old_price: 50.0,
    ),
    Product(
      id: 'p5',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageURL:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      prod_old_price: 50.0,
    ),
    Product(
      id: 'p6',
      title: 'Underware',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageURL:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      prod_old_price: 50.0,
    ),
  ];

  final dbRef = FirebaseDatabase.instance.reference().child("products");

  @override
  void initState() {
    getDocs();
    //getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(products.length);
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
                title: products[i].title,
                imageURL: products[i].imageURL,
                prod_old_price: products[i].prod_old_price,
                price: products[i].price,
                id: products[i].id,
                description: products[i].description),
          ),
        ),
      ],
    );
  }

  // void getProducts() async {
  //   FutureBuilder(
  //     future: dbRef.once(),
  //     builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
  //       if (snapshot.hasData) {
  //         products.clear();
  //         Map<dynamic, dynamic> values = snapshot.data.value;
  //         values.forEach((key, values) {
  //           products.add(values);
  //         });
  //       }
  //     },
  //   );
  //   print(products.length);
  // }
}
