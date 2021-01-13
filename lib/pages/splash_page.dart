import 'package:flutter/material.dart';
import 'package:picture_lib/pages/base/base_page_stateful_widget.dart';
import 'package:picture_lib/router/fluroplus/fluro_plus_navigate.dart';
import 'package:picture_lib/router/router.dart';
import 'package:picture_lib/utils/image_helper.dart';

class SplashPage extends BasePageStatefulWidget {
  @override
  getState() => _SplashPageState();
}

class _SplashPageState extends BasePageStatefulWidgetState<SplashPage> {
  _gotoHomePage() {
    FluroPlusNavigate.goto(context, Routers.home);
  }

  @override
  Widget buildBody() {
    return GestureDetector(
      onTap: _gotoHomePage,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.8,
            child: ImageHelper.getNetworkImage(
                'http://ucoon.tech/PictureLib/splash_bg.jpg', 'splash_bg',
                suffix: 'jpg'),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'A FUNERAL',
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'welcome and click to join',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
