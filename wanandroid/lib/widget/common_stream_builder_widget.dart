import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CommonStreamBuilder<T> extends StatefulWidget {
  const CommonStreamBuilder(
      {Key key,
      this.waitingWidget,
      this.errorWidget,
      this.emptyWidget,
      this.contentWidget,
      this.stream})
      : super(key: key);

  //加载中Widget/
  final Widget waitingWidget;

  //网络失败Widget/
  final Widget errorWidget;

  //空布局/
  final Widget emptyWidget;

  //填充内容布局
  final Widget contentWidget;

  final Stream<T> stream;

  @override
  State<StatefulWidget> createState() {
    return _CommonStreamBuilderState();
  }
}

class _CommonStreamBuilderState extends State<CommonStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          ConnectionState connectionState = snapshot?.connectionState;
          if (ConnectionState.active == connectionState) {
          } else if (ConnectionState.done == connectionState) {
          } else if (ConnectionState.none == connectionState) {
          } else if (ConnectionState.waiting == connectionState) {
            return widget.waitingWidget != null
                ? widget.errorWidget
                : _buildWaitingWidget(context);
          }
          if (snapshot.hasError) {
            return widget.errorWidget != null
                ? widget.errorWidget
                : _buildErrorWidget(context, snapshot.error.toString());
          }
          if (snapshot.hasData) {
            return widget.contentWidget != null
                ? widget.contentWidget
                : _buildContentWidget(context);
          }
        });
  }

  Widget _buildErrorWidget(BuildContext context, errorInfo) {
    final snackBar = new SnackBar(content: new Text(errorInfo));

    Scaffold.of(context).showSnackBar(snackBar);
    return Container(
      height: 0.0,
    );
  }

  Widget _buildWaitingWidget(BuildContext context) {
    return Center(
      child: SpinKitCircle(color: Colors.red),
    );
  }

  Widget _buildEmptyWidget(BuildContext context) {
    return Center();
  }

  Widget _buildContentWidget(BuildContext context) {
    return Container(
      height: 0.0,
    );
  }
}
