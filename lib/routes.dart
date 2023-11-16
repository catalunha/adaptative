import 'package:adaptative/pages/splash/splash_route.dart';
import 'package:flutter/material.dart';

import 'pages/home/home_route.dart';

sealed class Routes {
  static Route<dynamic> routes(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case '/':
        builder = SplashRoute().page;
        break;
      case '/home':
        builder = HomeRoute().page;
        break;
      default:
        throw Exception('Rota não encontrada');
    }
    return MaterialPageRoute(builder: builder, settings: settings);
  }
}

class RouteName {
  static String splash = '/';
  static String home = '/home';
}
