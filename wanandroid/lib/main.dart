import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome;
import 'package:flutter/cupertino.dart';
import 'package:wanandroid/config/routes.dart';
import 'package:wanandroid/config/application.dart';
import 'package:wanandroid/modal/account_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fluro/fluro.dart';
import 'dart:async';

void main() {
  //设置顶部状态类隐藏(即:全屏)
//  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(WanAndroidWidget());
  final StreamController ctrl = StreamController();
  final StreamSubscription subscription = ctrl.stream.listen((data) => print("=state=="+'$data'));

  // 往Stream中添加数据
  ctrl.sink.add('my name');
  ctrl.sink.add(1234);
  ctrl.sink.add({'a': 'element A', 'b': 'element B'});
  ctrl.sink.add(123.45);

  // StreamController用完后需要释放
  ctrl.close();
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class WanAndroidWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WanAndroidState();
  }
}

class _WanAndroidState extends State<WanAndroidWidget> {
  AccountModel model = new AccountModel();

  _WanAndroidState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AccountModel>(
      model: model,
      child: MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Color.fromRGBO(18, 18, 18, 1),
            cardColor: Colors.white,
            scaffoldBackgroundColor:const Color(0xFFF0F0F0)),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
