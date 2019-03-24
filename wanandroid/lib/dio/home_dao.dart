import 'package:dio/dio.dart';
import 'package:wanandroid/http/api.dart';
import 'package:wanandroid/dio/base_dao.dart';
import 'package:wanandroid/data/home_banner_data.dart';
import 'package:wanandroid/data/home_page_tab_data.dart';

//获取首页BannerData/
class HomeDao extends BaseDao {
  Future<HomeBannerData> getHomeBannerData() async {
    Response response = await client.get(Api.WAN_BANNER);
    var data = response?.data;
    if (data == null) {
      return null;
    }
    return HomeBannerData.fromJson(data);
  }

  //获取首页文章列表/
  Future<HomePageTabDataBean> getPageTabData(int page) async {
    Response response = await client
        .get(Api.WAN_PAGE_TAB + page.toString() + Api.WAN_PARAM_JSON);
    var data = response?.data;
    if (data == null) {
      return null;
    }
    return HomePageTabDataBean.fromJson(data);
  }
}
