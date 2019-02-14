
import 'package:flutter/material.dart';
import 'package:wanandroid/home/home.dart';
class PageRoutes{
  static String WELCOME_PAGE='/';
  static String HOME_PAGE = '/home';

  static Map<String,WidgetBuilder> getRoutes(){
    var route={
      HOME_PAGE:(BuildContext context){
        return HomeState();
      }
    };
    return route;
  }
}