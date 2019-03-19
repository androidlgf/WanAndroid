import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:wanandroid/config/application.dart';
import 'package:wanandroid/config/routes.dart';

//页面跳转管理/
class NavigatorUtil {
//登录主页
  static void goHome(BuildContext context) {
    TransitionType transitionType = TransitionType.nativeModal;
    Application.router
        .navigateTo(context, Routes.doHome, transition: transitionType);
  }
}
