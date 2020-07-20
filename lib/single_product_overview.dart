import 'package:flutter/material.dart';

class SingleProductOverview extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;
  final String description;
  final double prod_old_price;
  final double price;

  //static const pageRoute = '/single-prod';

  SingleProductOverview(
      {@required this.title,
      @required this.imageURL,
      @required this.prod_old_price,
      @required this.price,
      @required this.id,
      @required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(title),
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$$prod_old_price',
              style: TextStyle(
                  fontSize: 20, decoration: TextDecoration.lineThrough),
            ),
            Text(
              '\$$price',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text('Size : ')),
                        Expanded(child: Icon(Icons.arrow_drop_down)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text('Color : ')),
                        Expanded(child: Icon(Icons.arrow_drop_down)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text('Qty : ')),
                        Expanded(child: Icon(Icons.arrow_drop_down)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Buy Now"),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
                IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            ListTile(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              //width: double.infinity,
              title: Text(
                'Product Description',
                
              ),
              subtitle: Text(
                description, 
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      //drawer: SideDrawer(),
    );
  }
}
