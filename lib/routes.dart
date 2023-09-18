import 'package:flutter/widgets.dart';
import 'package:project1/screens/dashboard_screen.dart';
import 'package:project1/screens/item_screen.dart';
import 'package:project1/screens/login_screen.dart';
import 'package:project1/screens/task_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/login': (BuildContext context) => LoginScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),
    '/item': (BuildContext context) => ItemScreen(),
    '/tasks': (BuildContext context) => TaskScreen(),
  };
}
