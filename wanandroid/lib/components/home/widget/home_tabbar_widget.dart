import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wanandroid/values/json_strings.dart';
import 'package:wanandroid/components/home/data/local_home_tab_data.dart';

class HomeTabBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeTabBarState();
  }
}

class _HomeTabBarState extends State<HomeTabBarWidget> with SingleTickerProviderStateMixin{
  var listOfTab = <Tab>[];

  @override
  Widget build(BuildContext context) {
    final localTabJson = json.decode(JsonStrings.localTab);
    final localTabObjects = localTabJson.map((o) => LocalHomeTab.fromJson(o));
    final listOfTabObjects = localTabObjects.toList();
    listOfTabObjects.forEach((object) {
      listOfTab.add(Tab(text: object.tab));
    });
    TabController tabController =
    new TabController(length: listOfTabObjects.length, vsync: this);
    return Container(
      color: Color.fromRGBO(18, 18, 18, 1),
      height: 44,
      child: TabBar(
        isScrollable: true,
        //是否可以滚动
        controller: tabController,
        labelColor: Colors.white,
        unselectedLabelColor: Color.fromRGBO(160, 160, 160, 1),
        labelStyle: TextStyle(fontSize: 16.0),
        tabs: listOfTab.map((Tab tab) {
          return tab;
        }).toList(),
      ),
    );
  }
}
