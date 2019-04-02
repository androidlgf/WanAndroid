import 'package:flutter/material.dart';
import 'package:wanandroid/blocs/bloc_provider.dart';
import 'package:wanandroid/data/home_banner_data.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wanandroid/widget/pull_to_refresh_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wanandroid/values/strings.dart';
import 'package:wanandroid/data/home_page_tab_data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid/blocs/bloc_pull_to_refresh.dart';
import 'package:wanandroid/widget/common_stream_builder_widget.dart';
//工具Tab/
class HomeToolTabWidget extends StatelessWidget {
  final RefreshController refreshController = new RefreshController();
  final List<PageTabData> listOfData=[];
  @override
  Widget build(BuildContext context) {
    final PullToRefreshBloc bloc = BlocProvider.of<PullToRefreshBloc>(context);
    bloc.statusEventStream.listen((event){
        refreshController.sendBack(false, event.status);
    });
    bloc.pageTabStream.listen((pageDataObjects){
      listOfData.addAll(pageDataObjects);
    });
    bloc.getBanner();
    bloc.request(page: 0);
    return CommonStreamBuilder(
      stream: bloc.pageTabStream,
      builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot){
        return PullToRefreshListView(
          itemCount: listOfData.length,
          refreshController: refreshController,
          onRefresh: (up) {
            if (up) {
              bloc.request(page: 0);
            } else {
              bloc.request();
            }
          },
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(listOfData[index], index);
          },
          headerBuilder: (BuildContext context) {
            return StreamBuilder(
                stream: bloc.bannerStream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<BannerData>> snapshot) {
                  if (snapshot.hasData) {
                    return _buildBanner(context, snapshot.data);
                  }
                  return Container(height: 0);
                });
          },
        );
      },
    );
  }

  Widget _buildBanner(BuildContext context, List<BannerData> listOfBanner) {
    return AspectRatio(
        aspectRatio: 16.0 / 9,
        child: Swiper(
          autoplay: false,
          itemCount: listOfBanner?.length,
          pagination: new SwiperPagination(
              margin: new EdgeInsets.all(0.0),
              builder: new SwiperCustomPagination(
                  builder: (BuildContext context, SwiperPluginConfig config) {
                return Container(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "${config.activeIndex + 1}/${config.itemCount}",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                  constraints: BoxConstraints.expand(height: 25.0),
                );
              })),
          itemBuilder: (BuildContext context, int index) {
            return CachedNetworkImage(
              imageUrl: listOfBanner[index]?.imagePath,
              fit: BoxFit.fill,
            );
          },
        ));
  }

  Widget _buildItem(PageTabData object, int index) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      elevation: 5.0,
      child: Container(
        height: ScreenUtil().setHeight(135),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(40),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15),
              child: Text(
                object?.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: const Color(0xFF2E3138), fontSize: 15),
              ),
            ),
            Container(
              height: 1,
              color: const Color(0xFFF0F0F0),
            ),
            Container(
              height: ScreenUtil().setHeight(40),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      home_page_tab_author_text + object?.author,
                      style: TextStyle(
                          color: const Color(0xFF2E3138), fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding:
                          EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                      child: Text(
                          home_page_tab_niceDate_text + object?.niceDate,
                          style: TextStyle(
                              color: const Color(0xFF2E3138), fontSize: 12)),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
                child: Container(
                  width: ScreenUtil().setWidth(69),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(95, 231, 243, 1.0),
                        Color.fromRGBO(95, 195, 243, 1.0),
                        Color.fromRGBO(95, 195, 243, 1.0)
                      ], begin: Alignment.topLeft, end: Alignment.topRight)),
                  child: Text(home_page_tab_title_text),
                ),
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
