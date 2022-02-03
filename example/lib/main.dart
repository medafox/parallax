import 'package:flutter/material.dart';
import 'package:example/parallax.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> listImages = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image5.jpg',
    'images/image6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Parallax(
      parallaxImages: listImages,
    );
  }
}
