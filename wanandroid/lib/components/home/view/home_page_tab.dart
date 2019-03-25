import 'package:flutter/material.dart';
import 'package:wanandroid/dio/home_dao.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wanandroid/data/home_banner_data.dart';
import 'package:easy_listview/easy_listview.dart';
import 'package:wanandroid/data/home_page_tab_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//首页Tab/
class HomePageTabWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageTabState();
  }
}

class _HomePageTabState extends State<HomePageTabWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[HomePageEasyListWidget()],
    );
  }
}

class HomeAutoSlideWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeAutoSlideState();
  }
}

class _HomeAutoSlideState extends State<HomeAutoSlideWidget> {
  HomeDao _dao;
  List<BannerData> listOfBanner = [];

  @override
  void initState() {
    super.initState();
    getBannerData();
  }

  void getBannerData() async {
    _dao ??= new HomeDao();
    HomeBannerData bannerData = await _dao?.getHomeBannerData();
    if (bannerData == null) {
      return;
    }
    setState(() {
      listOfBanner = bannerData?.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(180),
        color: Colors.white,
        child: Swiper(
          autoplay: false,
          itemCount: listOfBanner?.length,
          pagination: new SwiperPagination(
              margin: new EdgeInsets.all(0.0),
              builder: new SwiperCustomPagination(
                  builder: (BuildContext context, SwiperPluginConfig config) {
                return Container(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "${config.activeIndex + 1}/${config.itemCount}",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                  constraints: BoxConstraints.expand(height: 25.0),
                );
              })),
          itemBuilder: (BuildContext context, int index) {
            return CachedNetworkImage(
              imageUrl: listOfBanner[index]?.imagePath,
              fit: BoxFit.fill,
            );
          },
        ));
  }
}

class HomePageEasyListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageEasyListState();
  }
}

class _HomePageEasyListState extends State<HomePageEasyListWidget> {
  HomeDao _dao;
  List<PageTabData> listOfPageTabData = [];
  int curPage = 0;
  int total = 0;
  int pageSize = 0;
  bool isLoadMore = false;

  @override
  void initState() {
    super.initState();
    getPageTabData();
  }

  Future<HomePageTabDataBean> getPageTabData() async {
    _dao ??= new HomeDao();
    HomePageTabDataBean bannerData = await _dao?.getPageTabData(curPage);
    setState(() {
      HomePageTabData data = bannerData.data;
      if (data == null) {
        return null;
      }
      curPage += 1;
      total = data.total;
      total = 40;
      pageSize = data.size;
      if (curPage * pageSize >= total) {
        isLoadMore = false;
      } else {
        isLoadMore = true;
      }
      listOfPageTabData.addAll(data.datas);
    });
    return bannerData;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: EasyListView(
        loadMore: isLoadMore,
        itemCount: listOfPageTabData.length,
        onLoadMore: () {
          getPageTabData();
        },
        headerBuilder: (BuildContext context) {
          return HomeAutoSlideWidget();
        },
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(listOfPageTabData[index], index);
        },
      ),
      flex: 1,
    );
  }

  Widget _buildItem(PageTabData object, int index) {
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
                    '作者:' + object?.author,
                    style:
                        TextStyle(color: const Color(0xFF2E3138), fontSize: 12),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(100)),
                    child: Text('时间:' + object?.niceDate,
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
                  child: Text(object.chapterName),
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
