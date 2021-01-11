import 'package:flutter/material.dart';
import 'package:picture_lib/configs/application.dart';
import 'package:picture_lib/utils/log_util.dart';

///无状态页面基类
abstract class BasePageStatelessWidget extends StatelessWidget {
  BuildContext context = Application.appContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, //重新计算布局空间大小
      backgroundColor: Colors.black,
      body: WillPopScope(
        child: SafeArea(
          child: buildBody(context),
        ),
        onWillPop: onBackPressed,
      ),
    );
  }

  ///物理返回
  Future<bool> onBackPressed() async {
    Logger('BasePageStatelessWidget.onBackPressed').log('');
    return true;
  }

  ///构建内容区
  Widget buildBody(BuildContext context);
}
