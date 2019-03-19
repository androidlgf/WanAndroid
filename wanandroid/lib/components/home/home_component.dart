
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class HomeComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeComponentState();
  }
}

class _HomeComponentState extends State<HomeComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: HomeBuilder.homeDrawer(),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
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