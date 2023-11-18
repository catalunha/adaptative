import 'package:adaptative/pages/splash/splash_route.dart';
import 'package:flutter/material.dart';

import 'data/models/task.dart';
import 'pages/home/home_route.dart';
import 'pages/todo/list/todo_list_route.dart';
import 'pages/todo/update/todo_update_route.dart';

sealed class Routes {
  static Route<dynamic> routes(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case RouteName.splash:
        builder = SplashRoute().page;
        break;
      case RouteName.home:
        builder = HomeRoute().page;
        break;
      case RouteName.todoList:
        builder = TodoListRoute().page;
        break;
      case RouteName.todoUpdate:
        builder = (_) => TodoUpdateRoute().page(_, settings.arguments as Task);
        break;
      default:
        throw Exception('Rota não encontrada');
    }
    return MaterialPageRoute(builder: builder, settings: settings);
  }
}

class RouteName {
  static const String splash = '/';
  static const String home = '/home';
  static const String todoList = '/todoList';
  static const String todoUpdate = '/todoUpdate';
}
