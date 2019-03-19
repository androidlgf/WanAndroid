import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid/config/routes.dart';
import 'package:wanandroid/config/application.dart';
import 'package:wanandroid/widget/skip_down_time.dart';
import 'package:fluro/fluro.dart';
import 'package:wanandroid/values/strings.dart';

class AppComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppComponentState();
  }
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
//          color: Colors.white,
          child: Image.network(
            welcome_image,
            fit: BoxFit.cover,
          ),
          constraints: BoxConstraints.expand(),
        ),
        Container(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.only(top: 30.0, right: 20.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CircleProgressBar(
                    duration: 10000,
                    radius: 20.0,
                  ),
                  Text(
                    welcome_skip_text,
                    style: new TextStyle(color: Colors.blue, fontSize: 12.0),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
