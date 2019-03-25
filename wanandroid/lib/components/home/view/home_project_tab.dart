import 'package:flutter/material.dart';
import 'package:wanandroid/dio/home_dao.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_listview/easy_listview.dart';
import 'package:wanandroid/data/home_page_tab_data.dart';
import 'package:wanandroid/data/home_project_tab_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wanandroid/values/strings.dart';

//项目Tab/
class HomeProjectTabWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeProjectTabState();
  }
}

class _HomeProjectTabState extends State<HomeProjectTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[HomeProjectEasyListWidget()],
    );
  }
}

class HomeProjectEasyListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeProjectEasyListState();
  }
}

class _HomeProjectEasyListState extends State<HomeProjectEasyListWidget> {
  HomeDao _dao;
  List<ProjectTabData> listOfProjectTabData = [];
  int curPage = 0;
  int total = 0;
  int pageSize = 0;
  bool isLoadMore = false;

  @override
  void initState() {
    super.initState();
    getProjectTabData();
  }

  Future<HomeProjectTabDataBean> getProjectTabData() async {
    _dao ??= new HomeDao();
    HomeProjectTabDataBean projectTabDataBean =
        await _dao?.getProjectTabData(curPage);
    setState(() {
      HomeProjectTabData data = projectTabDataBean.data;
      if (data == null) {
        return null;
      }
      curPage += 1;
      total = data.total;
      pageSize = data.size;
      if (curPage * pageSize >= total) {
        isLoadMore = false;
      } else {
        isLoadMore = true;
      }
      listOfProjectTabData.addAll(data.datas);
    });
    return projectTabDataBean;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: EasyListView(
        loadMore: isLoadMore,
        itemCount: listOfProjectTabData.length,
        onLoadMore: () {
          getProjectTabData();
        },
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(listOfProjectTabData[index], index);
        },
      ),
      flex: 1,
    );
  }

  Widget _buildItem(ProjectTabData object, int index) {
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
                object?.title,
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
                  Text(
                    home_page_tab_author_text + object?.author,
                    style:
                        TextStyle(color: const Color(0xFF2E3138), fontSize: 12),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(100)),
                    child: Text(home_page_tab_niceDate_text + object?.niceDate,
                        style: TextStyle(
                            color: const Color(0xFF2E3138), fontSize: 12)),
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
                  child: Text('项目'),
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
