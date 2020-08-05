import 'package:application/providers/cart_products.dart';
import 'package:application/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Your Cart",
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text("Total : "),
                  subtitle: Text("\$240"),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5.0,
                  color: Colors.red,
                  onPressed: () {},
                  child: Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: CartProducts(),
      drawer: SideDrawer(),
    );
  }
}
