import 'package:flutter/material.dart';
import 'package:wanandroid/dio/home_dao.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_listview/easy_listview.dart';
import 'package:wanandroid/data/home_page_tab_data.dart';
import 'package:wanandroid/data/home_project_tab_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wanandroid/values/strings.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
      child: StaggeredGridView.countBuilder(
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemCount: listOfProjectTabData.length,
        itemBuilder: (context, index) {
          return _buildItem(listOfProjectTabData[index], index);
        },
        staggeredTileBuilder: (index) {
          return StaggeredTile.fit(2);
        },
      ),
      flex: 1,
    );
  }

  Widget _buildItem(ProjectTabData object, int index) {
    return Card(
//      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      elevation: 5.0,
      child: Image.network(
        object?.envelopePic,
        fit: BoxFit.fill,
      ),
//      child: AspectRatio(
//          aspectRatio:2/3,
//          child: Image.network(object?.envelopePic,fit: BoxFit.fill,),
//      ),
    );
  }
}
