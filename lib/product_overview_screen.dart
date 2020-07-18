import 'package:application/drawer.dart';
import 'package:application/image_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("EEVOK Clothing App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: SideDrawer(),
      body: ListView(
        children: <Widget>[
          ImageSlider(),

        ],
      ),
    );
  }
}
