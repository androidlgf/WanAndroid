import 'dart:collection';

import 'package:rxdart/subjects.dart';
import 'package:wanandroid/dio/home_dao.dart';
import 'package:wanandroid/data/home_banner_data.dart';
import 'package:wanandroid/blocs/bloc_provider.dart';

class HomeBloc implements BlocBase {
  HomeDao _dao;

  BehaviorSubject<List<BannerData>> _banner =
      BehaviorSubject<List<BannerData>>();

  Sink<List<BannerData>> get _bannerSink => _banner.sink;

  Stream<List<BannerData>> get bannerStream => _banner.stream;

  @override
  void initState() {}

  @override
  void didChangeDependencies() {}

  void dispose() {
    _banner.close();
  }

  Future getBanner() async {
    _dao ??= new HomeDao();
    HomeBannerData bannerData = await _dao?.getHomeBannerData();
    if (bannerData == null) {
      return null;
    }
    _bannerSink.add(bannerData.data);
    return bannerData?.data;
  }
}
