import 'package:application/product_overview_screen.dart';

import 'package:flutter/material.dart';
// dev
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EEVOK Clothing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductsOverviewScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

