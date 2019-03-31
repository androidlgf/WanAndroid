import 'package:wanandroid/config/component_index.dart';
import 'package:wanandroid/blocs/Ibloc_pull_to_refresh.dart';
import 'package:wanandroid/dio/home_dao.dart';
import 'package:rxdart/subjects.dart';
import 'package:wanandroid/data/home_banner_data.dart';
import 'package:wanandroid/data/home_page_tab_data.dart';

class PullToRefreshBloc extends IPullToRefreshBloc {
  HomeDao _dao;

  BehaviorSubject<List<BannerData>> _banner =
      BehaviorSubject<List<BannerData>>();

  Sink<List<BannerData>> get bannerSink => _banner.sink;

  Stream<List<BannerData>> get bannerStream => _banner.stream;

  BehaviorSubject<List<PageTabData>> _pageTabSubject =
      BehaviorSubject<List<PageTabData>>();

  Sink<List<PageTabData>> get pageTabSink => _pageTabSubject.sink;

  Stream<List<PageTabData>> get pageTabStream => _pageTabSubject.stream;

  //获取轮询Data/
  Future getBanner() async {
    _dao ??= new HomeDao();
    HomeBannerData bannerData = await _dao?.getHomeBannerData();
    if (bannerData == null) {
      return null;
    }
    bannerSink.add(bannerData.data);
    return bannerData?.data;
  }

  //获取列表数据/
  Future<List<PageTabData>> getPageTabData(int page) async {
    _dao ??= new HomeDao();
    HomePageTabDataBean bannerData = await _dao?.getPageTabData(page);
    if (bannerData == null) {
      return null;
    }
    HomePageTabData data = bannerData.data;
    if (data == null) {
      return null;
    }
    pageTabSink.add(data.datas);
    return data?.datas;
  }

  @override
  Future request({String path, int page}) async {
    _dao ??= new HomeDao();
    return null;
  }

  @override
  Future onLoadMore({String labelId}) {
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    return null;
  }
  @override
  void dispose() {}
}
