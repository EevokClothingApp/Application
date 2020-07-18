import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/1.jpg'),
          AssetImage('images/2.jpg'),
          AssetImage('images/2.jfif'),
          AssetImage('images/3.jpg'),
        ],
        autoplay: true, //make true later
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(seconds: 2),
        dotSize: 5.0,
      ),
    );
  }
}