import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

//final List<String> imgList = [
//  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
//];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  final List<String> images = [];

  CarouselWithIndicator(images) {
    this.images.addAll(images);
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
