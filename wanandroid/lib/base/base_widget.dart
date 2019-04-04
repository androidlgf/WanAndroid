import 'package:flutter/material.dart';
import 'package:wanandroid/widget/load_dialog.dart';
import 'package:wanandroid/config/component_index.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  static BuildContext _loadContext;
  @override
  Widget build(BuildContext context) {
    _loadContext=context;
    return null;
  }

  void showLoading() {
    showDialog(
        context: _loadContext,
        builder: (BuildContext context) {
          return LoadDialog();
        });
  }

  void hideLoading() {
    Navigator.pop(_loadContext);
  }

  //Toast提示/
  void showMessage(String message) {
    Fluttertoast.showToast(msg: message ?? '');
  }

//底部错误提示/
  void onError(String errorInfo) {
    Builder(builder: (BuildContext context) {
      final SnackBar snackBar =
          new SnackBar(content: new Text(errorInfo ?? ''));
      Scaffold.of(context).showSnackBar(snackBar);
      return snackBar;
    });
  }

  //关闭键盘/
  void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  Future<bool> isNetworkConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    }
    return false;
  }
}
