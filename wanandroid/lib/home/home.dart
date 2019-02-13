import 'package:flutter/material.dart';
import 'package:wanandroid/http/http_client.dart';
import 'package:wanandroid/http/api.dart';
import 'package:wanandroid/widget/indicator_widget.dart';
import 'package:wanandroid/modal/serializable_banner_object.dart';
import 'dart:convert';

class HomeState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeState();
  }
}

class _HomeState extends State<HomeState> {
  CarouselWithIndicator indicator;
  @override
  void initState() {
    super.initState();
    _getBanner().then((banners){
     this.setState(() {
       indicator=new CarouselWithIndicator(banners);
     });
   });
  }

  @override
  void didUpdateWidget(HomeState oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        indicator!=null?indicator:Container(),
      ],
    );
  }
}
Future<List<String>> _getBanner() async{
   List<String> bean=[];
   await HttpClient().get(Api.WAN_BANNER).then((response) {
      SerializableBannerObject bannerObject=SerializableBannerObject.fromJson(json.decode(response.toString()));
      List<SerializableBannerDataObject> bannerDatas=bannerObject.data;
       for(int i=0;i<bannerDatas.length;i++){
         bean.add(bannerDatas[i].imagePath);
       }
   });
   return  bean;
}
