import 'package:flutter/material.dart';
import 'package:wanandroid/blocs/bloc_pull_to_refresh.dart';
import 'package:wanandroid/config/component_index.dart';

//列表上拉加载更多/
class PullToRefreshWidget extends StatelessWidget {
  const PullToRefreshWidget(
      {Key key,
      this.bloc,
      this.itemBuilder,
      this.headerBuilder,
      this.footerBuilder})
      : super(key: key);

  final PullToRefreshBloc bloc;
  final IndexedWidgetBuilder itemBuilder;
  final WidgetBuilder headerBuilder;
  final WidgetBuilder footerBuilder;

  @override
  Widget build(BuildContext context) {
    RefreshController _controller = new RefreshController();
    bloc?.request();
    return StreamBuilder(
        stream: bloc?.pullToRefreshStream,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          return RefreshIndicator(
              child: SmartRefresher(
                  enablePullDown: false,
                  enablePullUp: true,
                  enableOverScroll: false,
                  controller: _controller,
                  onRefresh: (up) {
                    print("===refresh=下拉更多=");
                  },
                  child: ListView(
                    children: <Widget>[
                      headerBuilder(context),
                      _buildContent(context, snapshot.data)
                    ],
                  )),
              onRefresh: () {
                print("===refresh=上拉刷新=");
              });
        });
  }

  Widget buildItem(BuildContext context, obj) {
    return null;
  }

  Widget buildHeader(BuildContext context) {
    return null;
  }

  Widget buildFooter(BuildContext context) {
    return null;
  }

  Widget _buildContent(BuildContext context, List objects) {
    if (ObjectUtil.isEmpty(objects)) {
      return new Container(height: 0.0);
    }
    List<Widget> _children = objects.map((model) {
      return buildItem(context, model);
    }).toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _children,
    );
  }

  bool _hasHeader() => headerBuilder != null;

  bool _hasFooter() => footerBuilder != null;
}
