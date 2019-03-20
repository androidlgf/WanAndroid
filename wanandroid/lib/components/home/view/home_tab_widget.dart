import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wanandroid/values/json_strings.dart';
import 'package:wanandroid/components/home/data/local_home_tab_data.dart';

class HomeTabWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeTabWidgetState();
  }
}

class _HomeTabWidgetState extends State<HomeTabWidget>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController(initialPage: 0);
  TabController tabController;
  var tabs = <Tab>[];
  var currentPage = 0;
  var isPageCanChanged = true;

  @override
  void initState() {
    super.initState();
    final localTabJson = json.decode(JsonStrings.localTab);
    final localTabObjects = localTabJson.map((o) => LocalHomeTab.fromJson(o));
    final listOfTabObjects = localTabObjects.toList();
    tabController =
        new TabController(length: listOfTabObjects.length, vsync: this);
    tabController.addListener(() {
      //TabBar的监听
      if (tabController.indexIsChanging) {
        //判断TabBar是否切换
        print(tabController.index);
        onPageChange(tabController.index, p: pageController);
      }
    });
    listOfTabObjects.forEach((object) {
      tabs.add(Tab(text: object.tab));
    });
  }

  onPageChange(int index, {PageController p, TabController t}) async {
    if (p != null) {
      //判断是哪一个切换
      isPageCanChanged = false;
      await pageController.animateToPage(index,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease); //等待pageview切换完毕,再释放pageivew监听
      isPageCanChanged = true;
    } else {
      tabController.animateTo(index); //切换Tabbar
    }
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            color: new Color(0xfff4f5f6),
            height: 38.0,
            child: TabBar(
              isScrollable: true,
              //是否可以滚动
              controller: tabController,
              labelColor: Colors.red,
              unselectedLabelColor: Color(0xff666666),
              labelStyle: TextStyle(fontSize: 16.0),
              tabs: tabs.map((Tab tab) {
                return tab;
              }).toList(),
            )),
        Expanded(
            child: PageView.builder(
                itemCount: tabs.length,
                controller: pageController,
                onPageChanged: (index) {
                  if(isPageCanChanged){
                    onPageChange(index);
                  }
                },
                itemBuilder: (BuildContext context, int index) {
                  return Text(tabs[index].text);
                }),
            flex: 1)
      ],
    );
  }
}
