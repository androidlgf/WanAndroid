class Api {
  static const String WAN_HOST = 'https://www.wanandroid.com';

  static const String WAN_BANNER = WAN_HOST + '/banner/json'; //首页banner

  static const String WAN_TAB = '/wxarticle/chapters/json '; //获取公众号列表 GET
  static const String WAN_PAGE_TAB = WAN_HOST + '/article/list/'; //首页文章列表
  static const String WAN_PARAM_JSON = '/json';

  static const String WAN_TAB_PROJECT =
      WAN_HOST + '/article/listproject/'; //所有项目列表

  static const String WAN_SYSTEM_URL = WAN_HOST + '/tree/json'; //体系数据列表
  static const String WAN_OFFICIAL_URL =
      WAN_HOST + '/wxarticle/list/408/1/json'; //获取公众号列表
  static const String WAN_NAVIGATION_URL = WAN_HOST + '/navi/json'; //导航列表
  static const String WAN_NEW_PROJECT = '/article/listproject/0/json';
}
