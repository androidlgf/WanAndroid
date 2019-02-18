import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanandroid/widget/skip_down_time.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
//          color: Colors.white,
          child: Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550226828972&di=2df552fc5c1fbcb471dbb5eac5756521&imgtype=0&src=http%3A%2F%2Fww1.sinaimg.cn%2Flarge%2F85cccab3gw1etdogky3lgg208w0dcaxs.jpg',
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
                  CircleProgressBar(duration: 10000,radius: 20.0,),
                  Text('跳转',style: new TextStyle(color: Colors.blue,fontSize: 12.0),)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
