import 'package:flutter/material.dart';
import 'package:wanandroid/http/http_client.dart';
import 'package:wanandroid/http/api.dart';
import 'package:wanandroid/widget/indicator_widget.dart';
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
  List<String> banners;
  @override
  void initState() {
    super.initState();
    _getBanner().then((banners){
     this.setState(() {
//       this.banners=banners;
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
    print('====build='+indicator.toString());
    return Column(
      children: <Widget>[
        indicator,
      ],
    );
  }
}
Future<List<String>> _getBanner() async{
   List<String> bean=[];
   await HttpClient().get(Api.WAN_BANNER).then((response) {
       final dynamicListOfStrings=json.decode(response.toString());
       List dataList=List.from(dynamicListOfStrings['data']);
       for(int i=0;i<dataList.length;i++){
         bean.add(dataList[i]['imagePath'].toString());
       }
   });
   return  bean;
}
