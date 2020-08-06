import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:time_line/pages/signIn/index.dart';
import 'package:time_line/pages/signUp/index.dart';
import 'package:time_line/layout/basicLayout.dart';
import 'package:time_line/pages/photoAlbumPage/index.dart';
import 'package:time_line/pages/photoPage/index.dart';

class RouteConfig {
  static final initRouteName = '/basicLayout';

  static final Map<String, WidgetBuilder> router = {
    '/basicLayout': (BuildContext context) => BasicLayout(),
    '/signIn': (BuildContext context) => SignIn(),
    '/signUp': (BuildContext context) => SignUp(),
    '/photoAlbum': (BuildContext context, {arguments}) => PhotoAlbumPage(arguments:arguments),
    '/photoPage':(BuildContext context,{arguments})=> PhotoPage(arguments:arguments),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // 统一处理路由
    final String name = settings.name;
    final Function pageContentBuilder = router[name];
    print('routeNameSettings ------ $settings');

    // 定义当前需要返回的 route 对象
    Route route;
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        // 带参数的处理方式
        switch (name) {
          default:
            route = CupertinoPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            break;
        }
      } else {
        // 不带参数的处理方式
        switch (name) {
          case '/signUp':
            route = CupertinoPageRoute(
                builder: (context) => pageContentBuilder(context),
                fullscreenDialog:
                    true // fullscreenDialog表示新的路由页面是否是一个全屏的模态对话框，在iOS中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）。
                );
            break;
          default:
            route = CupertinoPageRoute(
                builder: (context) => pageContentBuilder(context));
            break;
        }
      }
    }
    return route;
  }
}
