import 'package:picture_lib/pages/home_page.dart';
import 'package:picture_lib/pages/splash_page.dart';
import 'fluroplus/fluro_plus_page_router.dart';
import 'fluroplus/fluro_plus_page_routers.dart';

/// fluro 路由管理类
class Routers extends FluroPlusPageRouters {
  static const root = '/'; //启动页
  static const home = '/home'; //首页

  @override
  List<FluroPlusPageRouter> generatorRoutes() {
    return [
      FluroPlusPageRouter(
          path: root,
          widgetFunc: (bundle) {
            return SplashPage();
          }),
      FluroPlusPageRouter(
          path: home,
          widgetFunc: (bundle) {
            return HomePage();
          }),
    ];
  }
}
