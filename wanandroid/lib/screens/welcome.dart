import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanandroid/page_routes.dart';

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
          color: Colors.white,
          child: Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550141521769&di=59eef77b897e2f908c03709deea003f6&imgtype=0&src=http%3A%2F%2Fattachments.gfan.com%2Fforum%2Fattachments2%2F201307%2F12%2F193441k2i5i066m6hk91b6.jpg',
            fit: BoxFit.cover,
          ),
          constraints: BoxConstraints.expand(),
        ),
        Container(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.only(top: 30.0, right: 20.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      PageRoutes.HOME_PAGE, (Route<dynamic> route) => false);
                },
                child: Text(
                  '跳转',
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
