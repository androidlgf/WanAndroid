import 'package:flutter/material.dart';
import 'package:wanandroid/dio/home_dao.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wanandroid/data/home_banner_data.dart';
import 'package:easy_listview/easy_listview.dart';
import 'package:wanandroid/data/home_page_tab_data.dart';

//首页Tab/
class HomePageTabWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
      children: <Widget>[HomeAutoSlideWidget()],
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
    setState(() {
      listOfBanner = bannerData?.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 196,
        color: Colors.white,
        child: Swiper(
          autoplay: true,
          itemCount: listOfBanner?.length,
          pagination: SwiperPagination(),
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

  @override
  void initState() {
    super.initState();
    getPageTabData();
  }

  void getPageTabData() async {
    _dao ??= new HomeDao();
    HomePageTabDataBean bannerData = await _dao?.getPageTabData();
    setState(() {
      listOfPageTabData = bannerData.data.datas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return EasyListView(
        itemCount: listOfPageTabData.length + 1,
        loadMore: false,
        headerBuilder: (BuildContext context) {
          return HomeAutoSlideWidget();
        },
        itemBuilder: (BuildContext context, int index) {
          return Text(listOfPageTabData[index].title);
        });
  }
}
