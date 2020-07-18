import 'package:application/drawer.dart';
import 'package:application/horizontal_list_view.dart';
import 'package:application/image_slider.dart';
import 'package:application/recent_products.dart';
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
          SizedBox(height: 5.0,),
          HorizontalListView(),
          SizedBox(height: 5.0,),
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
          SizedBox(height: 5.0,),
          RecentProducts(),
        ],
      ),
    );
  }
}
