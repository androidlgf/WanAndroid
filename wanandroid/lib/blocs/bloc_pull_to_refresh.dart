import 'package:wanandroid/config/component_index.dart';
import 'package:wanandroid/blocs/Ibloc_pull_to_refresh.dart';
import 'package:wanandroid/dio/home_dao.dart';
import 'package:rxdart/subjects.dart';
import 'package:wanandroid/data/home_banner_data.dart';
import 'package:wanandroid/data/home_page_tab_data.dart';
import 'package:wanandroid/event/event.dart';

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

  BehaviorSubject<StatusEvent> _statusEvent = BehaviorSubject<StatusEvent>();

  Sink<StatusEvent> get statusEventSink => _statusEvent.sink;

  Stream<StatusEvent> get statusEventStream => _statusEvent.stream;

  int _reposPage = 0;
  int requestState = RequestStatus.requesting;

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
    HomePageTabDataBean bannerData = await _dao?.getPageTabData(_reposPage);
    if (bannerData == null) {
      statusEventSink.add(StatusEvent(status: 4));
      return null;
    }
    HomePageTabData data = bannerData.data;
    if (data == null) {
      statusEventSink.add(StatusEvent(status: 5));
      return null;
    }
    _reposPage += 1;
    statusEventSink.add(StatusEvent(status: 0));
    pageTabSink.add(data.datas);
    return data?.datas;
  }

  @override
  Future request({String path, int page}) async {
    _dao ??= new HomeDao();
    statusEventSink.add(StatusEvent(status: 2));
    return getPageTabData(page);
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
  void dispose() {
    _banner.close();
    _pageTabSubject.close();
    _statusEvent.close();
  }
}

class RequestStatus {
  static const int requestFailed = 0;
  static const int requestSuccess = 1;
  static const int requesting = 2;
  static const int requestCompleted = 3;
  static const int requestNoMore = 4;
}
