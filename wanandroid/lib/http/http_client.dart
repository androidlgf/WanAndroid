import 'dart:convert';

import 'package:dio/dio.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:vast_shop/event/event.dart';
//import 'package:vast_shop/http/api.dart';
//import 'package:vast_shop/values/strings.dart';

const METHOD_GET = 'GET';
const METHOD_POST = 'POST';
const METHOD_PUT = 'PUT';
const METHOD_DELETE = 'DELETE';

class HttpClient {
  static const int CONNECTION_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 10000;
  static const String _ENCODING = 'Accept-Encoding';
  static const String _Accept = 'Accept';
  static const String _HEADER_ACCEPT_TYPE = '*/*';

  factory HttpClient() {
    if (_instance == null) {
      _instance = HttpClient._internal();
    }
    return _instance;
  }

  HttpClient._internal() {
    _dio = Dio();
    _dio.interceptor.request.onSend = _onRequestInterceptor;
    _dio.interceptor.response.onSuccess = _onSuccessInterceptor;
    _dio.interceptor.response.onError = _onErrorInterceptor;
//    _setProxy();
  }

  static HttpClient _instance;

  Dio _dio;

  /// send a post request
  Future<Response> delete(String path,
          {dynamic data,
            Map<String, dynamic> headers,
            CancelToken cancelToken}) async {
    return _sendRequest(
            path,
            await _mergeOptions(
                    Options(data: data, headers: headers, method: METHOD_DELETE)));
  }

  /// send a post request
  Future<Response> put(String path,
      {dynamic data,
      Map<String, dynamic> headers,
      CancelToken cancelToken}) async {
    return _sendRequest(
        path,
        await _mergeOptions(
            Options(data: data, headers: headers, method: METHOD_PUT)));
  }

  /// send a post request
  Future<Response> post(String path,
      {dynamic data,
      Map<String, dynamic> headers,
      CancelToken cancelToken}) async {
    return _sendRequest(
        path,
        await _mergeOptions(
            Options(data: data, headers: headers, method: METHOD_POST)));
  }

  /// send a get request
  Future<Response> get(String path,
      {dynamic data,
      Map<String, dynamic> headers,
      CancelToken cancelToken}) async {
    return _sendRequest(
        path,
        await _mergeOptions(
            Options(data: data, headers: headers, method: METHOD_GET)));
  }

  Future<Response> _sendRequest(String path, Options options,
      {CancelToken cancelToken}) async {
    try {
      return await _dio.request(path,
          options: options, cancelToken: cancelToken);
    } on DioError {
      return null;
    }
  }

  Future<Options> _mergeOptions(Options newOptions) async {
    // default options
    var oldOps = await _buildDefaultOptions();
    // append new options
    if (newOptions != null) {
      // append new Headers
      var newHeaders = newOptions.headers;
      if (newHeaders != null) {
        oldOps.headers.addAll(newHeaders);
      }

      // merge options
      oldOps = oldOps.merge(
          connectTimeout: newOptions.connectTimeout,
          receiveTimeout: newOptions.receiveTimeout,
          data: newOptions.data,
          extra: newOptions.extra,
          contentType: newOptions.contentType,
          method: newOptions.method);
    }
    return oldOps;
  }

  /// default options
  /// headers, timeout time, base url,...
  Future<Options> _buildDefaultOptions() async {
    return Options(
//        baseUrl: Api.SHOP_HOST,
        baseUrl:'',
        connectTimeout: CONNECTION_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
        headers: await _getDefaultHeaders());
  }

  Future<Map<String, dynamic>> _getDefaultHeaders() async {
    Map<String, dynamic> headers = {
      _ENCODING: 'identity',
      _Accept: _HEADER_ACCEPT_TYPE
    };
    return headers;
  }

  DioError _onErrorInterceptor(DioError error) {
    print('request error !!!!!!!!!!!!!!!!!! \n \t\t ${error.toString()}');
    var response = error.response;
    var dara = response?.data;
    if (response?.statusCode == 401) {
//      Fluttertoast.showToast(msg: '鉴权失败, 请重新登录');
//      Event.fireSignOutEvent();
    } else if (dara != null) {
      var errorMsg = ErrorMsg.fromJson(json.decode(dara));
//      Fluttertoast.showToast(msg: errorMsg.message);
//      if (errorMsg.code == Api.ERROR_TOKEN_EXPIRED) {
//        Event.fireSignOutEvent();
//      }
    } else {
//      Fluttertoast.showToast(msg: http_time_out);
    }
    return error;
  }

  Response _onSuccessInterceptor(Response response) {
    print('************ onSuccess Response <<<<<<<<<<<<<<<<<');
    print('headers : \n');
    response.headers.forEach((name, value) {
      print('\t\t $name : $value \n');
    });
    print('params : ${response.request.data}');
    print('data : ${response.data}');
    return response;
  }

  Options _onRequestInterceptor(Options options) {
    print('''*********** onSend Request >>>>>>>>>>>>>>>>>>>>>> \n
      baseUrl : ${options.baseUrl}
      path : ${options.path}
      ''');
    _parseHeaders(options.headers);
    return options;
  }

  _parseHeaders(Map<String, dynamic> headers) {
    print('headers : \n');
    headers.forEach((name, value) {
      print('\t\t $name : $value \n');
    });
  }

//  _setProxy() async {
//    print('_setProxy');
//    var address = await SPUtil.get(PROXY_ADDRESS);
//    if (address.length > 0) {
//      Fluttertoast.showToast(msg: '正在使用代理 : $address');
//      _dio.onHttpClientCreate = (client) {
//        client.findProxy = (uri) {
//          return "PROXY $address";
//        };
//      };
//    }
//  }
}

class ErrorMsg {
  int code;
  String message;

  ErrorMsg.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'];
}
