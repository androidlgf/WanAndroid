import 'package:flutter/material.dart';
import 'package:wanandroid/blocs/bloc_home.dart';
import 'package:wanandroid/blocs/bloc_provider.dart';
import 'package:wanandroid/data/home_banner_data.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';


//工具Tab/
class HomeToolTabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    bloc.getBanner();
    return StreamBuilder(
      stream: bloc.bannerStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<BannerData>> snapshot) {
        if (snapshot.hasData) {
          return ListView(children: <Widget>[
            _buildBanner(context,snapshot.data)
          ],);
        }
      },
    );
  }

  Widget _buildBanner(BuildContext context, List<BannerData> listOfBanner) {
    return AspectRatio(aspectRatio: 16.0 / 9,child:  Swiper(
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
}
