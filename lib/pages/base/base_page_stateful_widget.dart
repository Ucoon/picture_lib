import 'package:flutter/material.dart';
import 'package:picture_lib/utils/log_util.dart';

///页面基类
abstract class BasePageStatefulWidget extends StatefulWidget {
  @override
  BasePageStatefulWidgetState createState() => getState();

  BasePageStatefulWidgetState getState();
}

abstract class BasePageStatefulWidgetState<T extends BasePageStatefulWidget> extends State<T> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, //重新计算布局空间大小
      backgroundColor: Colors.black,
      body: WillPopScope(
        child: SafeArea(
          child: buildBody(),
        ),
        onWillPop: onBackPressed,
      ),
    );
  }

  ///生命周期变化时回调
  ///resumed:应用可见并可响应用户操作(处于前台)
  ///inactive:用户可见，但不可响应用户操作
  ///paused:已经暂停了，用户不可见、不可操作（处于后台）
  ///detached：应用被挂起
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    Logger('BasePageStatefulWidget.didChangeAppLifecycleState').log('$state');
    switch (state) {
      case AppLifecycleState.resumed:
        onAppResume();
        break;
      case AppLifecycleState.inactive:
        onAppPause();
        break;
      case AppLifecycleState.paused:
        onAppStop();
        break;
      case AppLifecycleState.detached:
        onAppDestroy();
        break;
    }
  }

  /// Called when the system is running low on memory.
  /// 低内存回调
  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
    Logger('BasePageStatefulWidget.didHaveMemoryPressure').log('');
  }

  ///物理返回
  Future<bool> onBackPressed() async {
    Logger('BaseStatelessWidget.onBackPressed').log('');
    return true;
  }

  ///构建内容区
  Widget buildBody();

  onAppResume() {
    Logger('BasePageStatefulWidget.onAppResume').log('');
  }

  onAppPause() {
    Logger('BasePageStatefulWidget.onAppPause').log('');
  }

  onAppStop() {
    Logger('BasePageStatefulWidget.onAppStop').log('');
  }

  onAppDestroy() {
    Logger('BasePageStatefulWidget.onAppDestroy').log('');
  }
}
