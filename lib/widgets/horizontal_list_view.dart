import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category('icons/cloth.png', 'Gents'),
          Category('icons/dress.png', 'Ladies'),
          Category('icons/trouser.png', 'Pants'),
          Category('icons/heel.png', 'Heels'),
          Category('icons/shoe.png', 'Shoes'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imgURL;
  final String caption;

  Category(this.imgURL, this.caption);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80.0,
          child: ListTile(
            title: Image.asset(
              imgURL,
              //height: 100.0,
              //width: 80.0,
            ),
            subtitle: Text(
              caption,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
