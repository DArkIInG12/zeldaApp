import 'package:flutter/widgets.dart';
import 'package:project1/screens/add_career_screen.dart';
import 'package:project1/screens/add_task_screen.dart';
import 'package:project1/screens/add_teacher_screen.dart';
import 'package:project1/screens/calendar_screen.dart';
import 'package:project1/screens/career_screen.dart';
import 'package:project1/screens/dashboard_screen.dart';
import 'package:project1/screens/detail_movie_screen.dart';
import 'package:project1/screens/item_screen.dart';
import 'package:project1/screens/login_screen.dart';
import 'package:project1/screens/popular_screen.dart';
import 'package:project1/screens/provider_screen.dart';
import 'package:project1/screens/task_screen.dart';
import 'package:project1/screens/teacher_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/login': (BuildContext context) => const LoginScreen(),
    '/dash': (BuildContext context) => const DashboardScreen(),
    '/item': (BuildContext context) => ItemScreen(),
    '/tasks': (BuildContext context) => const TaskScreen(),
    '/addTask': (BuildContext context) => AddTaskScreen(),
    '/careers': (BuildContext context) => const CareerScreen(),
    '/addCareer': (BuildContext context) => AddCareerScreen(),
    '/teachers': (BuildContext context) => const TeacherScreen(),
    '/addTeacher': (BuildContext context) => AddTeacherScreen(),
    '/popular': (BuildContext context) => const PopularScreen(),
    '/detail': (BuildContext context) => const DetailMovieScreen(),
    '/provider': (BuildContext context) => const ProviderScreen(),
    '/calendar': (BuildContext context) => const CalendarScreen(),
  };
}
