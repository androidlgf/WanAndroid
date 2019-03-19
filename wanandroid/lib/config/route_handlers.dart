import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/components/app/app_component.dart';

//根布局/
var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AppComponent();
});
