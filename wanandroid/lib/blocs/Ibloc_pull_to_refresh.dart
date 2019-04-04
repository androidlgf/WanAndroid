import 'package:wanandroid/config/component_index.dart';

class IPullToRefreshBloc extends BlocBase {
  @override
  void dispose() {}

  @override
  void initState() {}

  @override
  void didChangeDependencies() {}
  //网络请求/
  Future request({String path, int page}) async {
    return null;
  }

  Future<int> getState() async {
    return 0;
  }

  //下拉加载更多/
  Future onLoadMore() {
    return null;
  }

  //下拉刷新/
  Future onRefresh() {
    return null;
  }
}
