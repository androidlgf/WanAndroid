import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid/components/home/widget/home_tab_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wanandroid/blocs/bloc_provider.dart';
import 'package:wanandroid/blocs/bloc_home.dart';
import 'package:wanandroid/blocs/bloc_pull_to_refresh.dart';
import 'dart:convert';
import 'package:wanandroid/values/json_strings.dart';
import 'package:wanandroid/components/home/data/local_home_tab_data.dart';
import 'package:wanandroid/components/home/view/home_bottom_mine_tab.dart';
import 'package:wanandroid/components/home/view/home_bottom_system_tab.dart';
import 'package:wanandroid/components/home/view/home_bottom_project_tab.dart';
import 'package:wanandroid/components/home/view/home_bottom_page_tab.dart';
import 'package:wanandroid/blocs/bloc_home_page_tab.dart';

class HomeComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeComponentState();
  }
}

class _HomeComponentState extends State<HomeComponent>
    with SingleTickerProviderStateMixin {
  int _bottomTabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    final localTabJson = json.decode(JsonStrings.localBottomTab);
    final localTabObjects = localTabJson.map((o) => LocalHomeTab.fromJson(o));
    final listOfTabObjects = localTabObjects.toList();

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.map,
                  color: _bottomTabIndex == 0 ? Colors.blue : Colors.grey),
              title: Text(
                listOfTabObjects[0].tab,
                style: TextStyle(
                    color: _bottomTabIndex == 0 ? Colors.blue : Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.tab,
                  color: _bottomTabIndex == 1 ? Colors.blue : Colors.grey),
              title: Text(
                listOfTabObjects[1].tab,
                style: TextStyle(
                    color: _bottomTabIndex == 1 ? Colors.blue : Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment,
                  color: _bottomTabIndex == 2 ? Colors.blue : Colors.grey),
              title: Text(
                listOfTabObjects[2].tab,
                style: TextStyle(
                    color: _bottomTabIndex == 2 ? Colors.blue : Colors.grey),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_ind,
                  color: _bottomTabIndex == 3 ? Colors.blue : Colors.grey),
              title: Text(
                listOfTabObjects[3].tab,
                style: TextStyle(
                    color: _bottomTabIndex == 3 ? Colors.blue : Colors.grey),
              )),
        ],
        onTap: (index) {
          setState(() {
            _bottomTabIndex = index;
          });
        },
      ),
//      body: BlocProvider<PullToRefreshBloc>(child: HomeTabWidget(), bloc: PullToRefreshBloc()),
      body: Stack(
        children: <Widget>[
          //首页/
          Offstage(
            offstage: _bottomTabIndex != 0,
            child: BlocProvider(
                child: BottomHomePageWidget(), bloc: HomePageTabBloc()),
          ),
          //体系/
          Offstage(
            offstage: _bottomTabIndex != 1,
            child: BottomHomeSystemWidget(),
          ),
          //项目/
          Offstage(
            offstage: _bottomTabIndex != 2,
            child: BottomHomeProjectWidget(),
          ),
          //我的/
          Offstage(
            offstage: _bottomTabIndex != 3,
            child: BottomHomeMineWidget(),
          )
        ],
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
