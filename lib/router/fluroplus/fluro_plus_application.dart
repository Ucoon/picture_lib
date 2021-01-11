import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:picture_lib/utils/log_util.dart';
import 'fluro_plus_bundle.dart';
import 'fluro_plus_page_routers.dart';

/// FluroPlusApp
/// 参考：https://juejin.im/post/5d7b67fe5188250a9858293a#heading-4
class FluroPlusApp{
  static final FluroRouter router = FluroRouter(); //全局路由
  static setupRoutes(FluroPlusPageRouters routers){
    router.notFoundHandler = Handler(handlerFunc: (context, params){
      Logger('FluroPlusApp.setupRoutes').log('route was not found');
      return Scaffold(
        body: Center(
          child: Text('route was not found'),
        ),
      );
    });

    routers.generatorRoutes().forEach((element) {
      Handler handler = Handler(handlerFunc: (context, params){
        return element.widgetFunc(Bundle.convert(params));
      });
      router.define(element.path, handler: handler);
    });
  }
}