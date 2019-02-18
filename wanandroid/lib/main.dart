import 'package:flutter/material.dart';
import 'package:wanandroid/screens/welcome.dart';
import 'package:flutter/services.dart' show SystemChrome;
import 'package:flutter/cupertino.dart';
import 'package:wanandroid/page_routes.dart';
import 'package:wanandroid/widget/skip_down_time.dart';
void main() {
  //设置顶部状态类隐藏(即:全屏)
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
//      home: CustomPaint(
//        painter: ProgressPainter(),
//      ),
      home: WelcomePage(),
      routes: PageRoutes.getRoutes(),
    );
  }
}
