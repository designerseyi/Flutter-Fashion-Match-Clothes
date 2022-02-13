import 'package:carousel_slider/carousel_slider.dart';
import 'package:color_matcher/App/pages/screenone.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      // body: CarouselSlider(
      //   options: CarouselOptions(
      //       height: screenHeight,
      //       viewportFraction: 0,
      //       enableInfiniteScroll: false,
      //       // enlargeCenterPage: true,
      //       initialPage: 0),
      //   items: [ScreenOne(), ScreenOne()],
      // )
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: ScreenOne(),
      ),
    );
  }
}
