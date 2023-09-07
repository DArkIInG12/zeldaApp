import 'package:flutter/widgets.dart';
import 'package:project1/screens/dashboard_screen.dart';
import 'package:project1/screens/item_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/dash': (BuildContext context) => DashboardScreen(),
    '/item': (BuildContext context) => ItemScreen(),
  };
}
