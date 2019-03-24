import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid/components/home/widget/home_tab_widget.dart';
import 'package:wanandroid/widget/async_future_builder.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeComponentState();
  }
}

class TabTitle {
  String title;
  int id;

  TabTitle(this.title, this.id);
}

class _HomeComponentState extends State<HomeComponent>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }
  Future _getData() async{
    Dio dio = new Dio();
    Response response=await dio.get("http://qa-video.oss-cn-beijing.aliyuncs.com/mp4/xfxz0227tvc.mp4");
    return response.data;
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: HomeBuilder.homeDrawer(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.all_inclusive),
        backgroundColor: Color(0xffd43d3d),
        elevation: 2.0,
        highlightElevation: 2.0,
        onPressed: () {},
      ),
      body: HomeTabWidget(),
    );
  }
}

class HomeBuilder {
  static Widget homeDrawer() {
    return new ListView(padding: const EdgeInsets.only(), children: <Widget>[
      _drawerHeader(),
      new ClipRect(
        child: new ListTile(
          leading: new CircleAvatar(child: new Text("A")),
          title: new Text('Drawer item A'),
          onTap: () => {},
        ),
      ),
      new ListTile(
        leading: new CircleAvatar(child: new Text("B")),
        title: new Text('Drawer item B'),
        subtitle: new Text("Drawer item B subtitle"),
        onTap: () => {},
      ),
      new AboutListTile(
        icon: new CircleAvatar(child: new Text("Ab")),
        child: new Text("About"),
        applicationName: "Test",
        applicationVersion: "1.0",
        applicationIcon: new Image.asset(
          "images/ymj_jiayou.gif",
          width: 64.0,
          height: 64.0,
        ),
        applicationLegalese: "applicationLegalese",
        aboutBoxChildren: <Widget>[
          new Text("BoxChildren"),
          new Text("box child 2")
        ],
      ),
    ]);
  }

  static Widget _drawerHeader() {
    return new UserAccountsDrawerHeader(
//      margin: EdgeInsets.zero,
      accountName: new Text(
        "SuperLuo",
      ),
      accountEmail: new Text(
        "super_luo@163.com",
      ),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: new AssetImage("images/ymj_jiayou.gif"),
      ),
      onDetailsPressed: () {},
      otherAccountsPictures: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage("images/ymj_shuijiao.gif"),
        ),
      ],
    );
  }
}
