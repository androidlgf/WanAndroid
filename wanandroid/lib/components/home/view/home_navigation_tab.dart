import 'package:flutter/material.dart';
import 'package:wanandroid/dio/home_dao.dart';
import 'package:easy_listview/easy_listview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wanandroid/values/strings.dart';
import 'package:wanandroid/data/home_navigation_tab_data.dart';
//导航Tab/
class HomeNavigationTabWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeNavigationTabState();
  }
}
class _HomeNavigationTabState extends State<HomeNavigationTabWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[HomeNavigationEasyListWidget()],
    );
  }
}
class HomeNavigationEasyListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeNavigationEasyListState();
  }
}

class _HomeNavigationEasyListState extends State<HomeNavigationEasyListWidget> {
  HomeDao _dao;
  List<NavigationTabData> listOfNavigationTabData = [];

  @override
  void initState() {
    super.initState();
    getNavigationTabData();
  }

  void getNavigationTabData() async {
    _dao ??= new HomeDao();
    HomeNavigationTabDataBean navigationTabDataBean = await _dao?.getNavigationTabData();
    setState(() {
      List<NavigationTabData> data = navigationTabDataBean.data;
      if (data == null) {
        return null;
      }
      listOfNavigationTabData.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: EasyListView(
        loadMore: false,
        itemCount: listOfNavigationTabData.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(listOfNavigationTabData[index], index);
        },
      ),
      flex: 1,
    );
  }

  Widget _buildItem(NavigationTabData object, int index) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      elevation: 5.0,
      child: Container(
        height: ScreenUtil().setHeight(135),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(40),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15),
              child: Text(
                object.articles[0].title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: const Color(0xFF2E3138), fontSize: 15),
              ),
            ),
            Container(
              height: 1,
              color: const Color(0xFFF0F0F0),
            ),
            Container(
              height: ScreenUtil().setHeight(40),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      home_page_tab_author_text +  object.articles[0]?.author,
                      style: TextStyle(
                          color: const Color(0xFF2E3138), fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding:
                      EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                      child: Text(
                          home_page_tab_niceDate_text +  object.articles[0]?.niceDate,
                          style: TextStyle(
                              color: const Color(0xFF2E3138), fontSize: 12)),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
                child: Container(
                  width: ScreenUtil().setWidth(69),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(95, 231, 243, 1.0),
                        Color.fromRGBO(95, 195, 243, 1.0),
                        Color.fromRGBO(95, 195, 243, 1.0)
                      ], begin: Alignment.topLeft, end: Alignment.topRight)),
                  child: Text('导航'),
                ),
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
