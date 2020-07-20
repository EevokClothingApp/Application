import 'package:application/product_overview_screen.dart';
import 'package:application/single_product_overview.dart';

import 'package:flutter/material.dart';

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
      routes: {
        //SingleProductOverview.pageRoute: (context) => SingleProductOverview(),
      },
    );
  }
}
