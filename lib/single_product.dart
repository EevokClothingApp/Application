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
      child: Card(
        child: Hero(
            tag: title,
            child: Material(
              child: InkWell(
                onTap: () {},
                child: GridTile(
                  child: Image.network(imageURL),
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      title: Text(
                        "\$$prod_old_price",
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                      leading: Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        '\$$price',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
