import 'package:application/loginpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eevok.clothing',
      debugShowCheckedModeBanner: false,
      
      routes: {
        //SingleProductOverview.pageRoute: (context) => SingleProductOverview(),
      },

      home: LoginPage(),

    );
  }
}

