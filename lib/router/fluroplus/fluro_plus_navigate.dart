import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:picture_lib/utils/log_util.dart';

import 'fluro_plus_application.dart';
import 'fluro_plus_bundle.dart';

/// fluro的路由跳转工具类
/// 参考：https://www.jianshu.com/p/1987cc9b714a
class FluroPlusNavigate {
  ///跳转新的页面
  static goto(
    BuildContext context,
    String path, {
    Bundle bundle,
    bool replace = false,
    bool clearStack = false,
    TransitionType transition: TransitionType.inFromLeft,
  }) {
    Logger('FluroPlusNavigate.goto').log('$path?arguments=${bundle?.toJson()}');
    FocusScope.of(context).requestFocus(FocusNode());
    FluroPlusApp.router.navigateTo(
      context,
      '$path?arguments=${bundle?.toJson()}',
      replace: replace,
      clearStack: clearStack,
      transition: transition,
    );
  }

  ///跳转新的页面并接收返回结果
  static gotoWithResult(
    BuildContext context,
    String path, {
    @required Function(dynamic) function,
    Bundle bundle,
    bool replace = false,
    bool clearStack = false,
    TransitionType transition: TransitionType.inFromLeft,
  }) {
    Logger('FluroPlusNavigate.goto').log('$path?arguments=${bundle?.toJson()}');
    FocusScope.of(context).requestFocus(FocusNode());
    FluroPlusApp.router
        .navigateTo(
      context,
      '$path?arguments=${bundle?.toJson()}',
      replace: replace,
      clearStack: clearStack,
      transition: transition,
    )
        .then((value) {
      if (value == null) {
        return;
      }
      function(value);
    }).catchError((err) {
      Logger('FluroPlusNavigate.gotoWithResult').log('$err');
    });
  }

  ///回退到上一页面
  static bool goBack(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    bool canPop = Navigator.canPop(context);
    if (canPop) {
      Navigator.pop(context);
    }
    return canPop;
  }

  /// 回退上一页面并携带参数
  static bool goBackWithParams(BuildContext context, result) {
    FocusScope.of(context).requestFocus(FocusNode());
    bool canPop = Navigator.canPop(context);
    if (canPop) {
      Navigator.pop(context, result);
    }
    return canPop;
  }
}
