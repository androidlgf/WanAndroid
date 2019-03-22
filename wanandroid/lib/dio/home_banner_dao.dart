import 'package:wanandroid/dio/base_dao.dart';
import 'package:wanandroid/data/home_banner_data.dart';
import 'package:dio/dio.dart';
import 'package:wanandroid/http/api.dart';

class HomeBannerDao extends BaseDao {
  Future<HomeBannerData> getHomeBannerData() async {
    Response response = await client.get(Api.WAN_BANNER);
    var data = response?.data;
    print("====data==="+data.toString());
    if (data == null) {
      return null;
    }
    print("====data==="+HomeBannerData.fromJson(data).toString());
    return HomeBannerData.fromJson(data);
  }
}
