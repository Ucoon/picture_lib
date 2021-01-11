import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';
import 'connectivity_request_retrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;
  RetryOnConnectionChangeInterceptor({@required this.requestRetrier});
  @override
  Future onError(DioError err) async{
    if (_shouldRetry(err)) {
      try {
        return requestRetrier.scheduleRequestRetry(err.request);
      } catch (e) {
        return e;
      }
    }
    return err;
  }

  //判断是否需要重试
  bool _shouldRetry(DioError error) {
    return error.type == DioErrorType.DEFAULT && error.error != null && error.error is SocketException;
  }
}
