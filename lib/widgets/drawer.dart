import 'package:application/screens/loginpage.dart';
import 'package:application/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            accountName: Text("Anushka"),
            accountEmail: Text("anushka@abc.com"),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            child: ListTile(
              title: Text("Home Page"),
              leading: Icon(
                Icons.home,
                color: Colors.indigo,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsOverviewScreen(),
                ),
              );
            },
          ),
          //Divider(),
          InkWell(
            child: ListTile(
              title: Text("My Account"),
              leading: Icon(
                Icons.person,
                color: Colors.pink,
              ),
            ),
            onTap: () {},
          ),
          //Divider(),
          InkWell(
            child: ListTile(
              title: Text("My Orders"),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.green,
              ),
            ),
            onTap: () {},
          ),
          //Divider(),
          InkWell(
            child: ListTile(
              title: Text("Categories"),
              leading: Icon(
                Icons.category,
                color: Colors.brown,
              ),
            ),
            onTap: () {},
          ),
          //Divider(),
          InkWell(
            child: ListTile(
              title: Text("Favorites"),
              leading: Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          InkWell(
            child: ListTile(
              title: Text("Settings"),
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          InkWell(
            child: ListTile(
              title: Text("About"),
              leading: Icon(
                Icons.info,
                color: Colors.blue,
              ),
            ),
            onTap: () {},
          ),
          //Divider(),
          InkWell(
            child: ListTile(
              title: Text("Sign Out"),
              leading: Icon(
                Icons.info,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
