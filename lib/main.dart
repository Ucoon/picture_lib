import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:picture_lib/provider/provider_manager.dart';
import 'package:picture_lib/router/fluroplus/fluro_plus_application.dart';
import 'package:picture_lib/router/router.dart';
import 'package:provider/provider.dart';
import 'configs/api.dart';
import 'configs/application.dart';
import 'generated/l10n.dart';
import 'http/http_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //注册 fluro router
  FluroPlusApp.setupRoutes(Routers());
  //初始化http
  HttpUtils.init(baseUrl: BASE_URL_RELEASE);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) {
          Application.appContext = context;
          return S.of(context).appName;
        },
        navigatorKey: Application.navKey,
        onGenerateRoute: FluroPlusApp.router.generator,
        localizationsDelegates: const [
          S.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
