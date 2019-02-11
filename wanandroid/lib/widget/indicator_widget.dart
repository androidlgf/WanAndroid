import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

//无限轮询ViewPager
class CarouselWithIndicator extends StatefulWidget {
  final List<String> images = [];

  CarouselWithIndicator(images) {
    if(images!=null){
      this.images.addAll(images);
    }
  }

  _CarouselWithIndicatorState createState() =>
      _CarouselWithIndicatorState(images);
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  List<String> images;

  _CarouselWithIndicatorState(this.images) {
    this.images = images;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        viewportFraction: 1.0,
        items: images.map((imageUrl) {
          return Builder(builder: (BuildContext context) {
            return Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: 1000.0,
            );
          });
        }).toList(),
        autoPlay: true,
        aspectRatio: 2.0,
        updateCallback: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: map<Widget>(images, (index, url) {
              return Container(
                width: 8.0,
                height: 8.0,
//                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromARGB(255, 255, 62, 150)
                        : Color.fromARGB(255, 255, 130, 171)),
              );
            }),
          ))
    ]);
  }
}
