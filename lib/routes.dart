import 'package:flutter/widgets.dart';
import 'package:project1/screens/add_task_screen.dart';
import 'package:project1/screens/dashboard_screen.dart';
import 'package:project1/screens/item_screen.dart';
import 'package:project1/screens/login_screen.dart';
import 'package:project1/screens/task_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/login': (BuildContext context) => const LoginScreen(),
    '/dash': (BuildContext context) => const DashboardScreen(),
    '/item': (BuildContext context) => ItemScreen(),
    '/tasks': (BuildContext context) => const TaskScreen(),
    '/addTask': (BuildContext context) => const AddTaskScreen()
  };
}
