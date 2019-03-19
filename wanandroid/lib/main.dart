import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome;
import 'package:flutter/cupertino.dart';
import 'package:wanandroid/config/routes.dart';
import 'package:wanandroid/config/application.dart';
import 'package:fluro/fluro.dart';

void main() {
  //设置顶部状态类隐藏(即:全屏)
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(WanAndroidWidget());
}

class WanAndroidWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WanAndroidState();
  }
}

class _WanAndroidState extends State<WanAndroidWidget> {
  _WanAndroidState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
    );
  }
}
