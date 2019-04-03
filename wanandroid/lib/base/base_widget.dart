import 'package:flutter/material.dart';
import 'package:wanandroid/config/component_index.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }

  void showLoading() {}

  void hideLoading() {}

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
}
