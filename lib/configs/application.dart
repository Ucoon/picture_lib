import 'package:flutter/material.dart';

class Application {
  static BuildContext _appContext; //全局上下文
  static set appContext(BuildContext appContext) => _appContext = appContext;
  static BuildContext get appContext => _appContext;

  static final navKey = GlobalKey<NavigatorState>();
}
