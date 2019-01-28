import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AutoSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      viewportFraction: 1.0,
      autoPlay: true,
      height: 150.0,
      items: [1, 2, 3, 4, 5].map((i) {
        return new Builder(
          builder: (BuildContext context) {
            return new Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Image.network(
                    'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg',
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
