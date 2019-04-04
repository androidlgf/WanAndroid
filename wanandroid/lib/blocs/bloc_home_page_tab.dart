import 'package:wanandroid/config/component_index.dart';
import 'package:wanandroid/blocs/Ibloc_pull_to_refresh.dart';
import 'package:wanandroid/dio/home_dao.dart';
import 'package:rxdart/subjects.dart';
import 'package:wanandroid/data/home_banner_data.dart';
import 'package:wanandroid/data/home_page_tab_data.dart';
import 'package:wanandroid/event/event.dart';

class HomePageTabBloc extends IPullToRefreshBloc {
  //当前请求Page/
  int _reposPage = 0;

  //列表更多数据/
  List<PageTabData> listOfObjects = [];
  HomeDao _dao;

  BehaviorSubject<List<BannerData>> _bannerSubject =
      BehaviorSubject<List<BannerData>>();

  Sink<List<BannerData>> get bannerSink => _bannerSubject.sink;

  Stream<List<BannerData>> get bannerStream => _bannerSubject.stream;

  BehaviorSubject<List<PageTabData>> _pageTabSubject =
      BehaviorSubject<List<PageTabData>>();

  Sink<List<PageTabData>> get pageTabSink => _pageTabSubject.sink;

  Stream<List<PageTabData>> get pageTabStream => _pageTabSubject.stream;

  BehaviorSubject<StatusEvent> _statusEventSubject =
      BehaviorSubject<StatusEvent>();

  Sink<StatusEvent> get statusEventSink => _statusEventSubject.sink;

  Stream<StatusEvent> get statusEventStream => _statusEventSubject.stream;

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
      statusEventSink.add(StatusEvent(status: StatusEvent.failed));
      return null;
    }
    HomePageTabData data = bannerData.data;
    if (data == null) {
      statusEventSink.add(StatusEvent(status: StatusEvent.noMore));
      return null;
    }
    List<PageTabData> listOfPageTabData = data.datas;
    if (listOfPageTabData == null || listOfPageTabData.length <= 0) {
      statusEventSink.add(StatusEvent(status: StatusEvent.noMore));
      return null;
    }
    if (page == 0) {
      listOfObjects.clear();
    }
    _reposPage += 1;
    statusEventSink.add(StatusEvent(status: StatusEvent.idle));
    listOfObjects.addAll(data.datas);
    pageTabSink.add(listOfObjects);
    return listOfObjects;
  }

  @override
  Future onRefresh() {
    _reposPage = 0;
    return getPageTabData(_reposPage);
  }

  @override
  Future onLoadMore() {
    return getPageTabData(_reposPage);
  }

  @override
  void initState() {
    super.initState();
    pageTabStream.listen((pageDataObjects) {
      listOfObjects.addAll(pageDataObjects);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bannerSubject?.close();
    _pageTabSubject?.close();
    _statusEventSubject?.close();
  }
}
