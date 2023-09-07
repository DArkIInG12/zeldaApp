import 'package:flutter/material.dart';
import 'package:project1/routes.dart';
import 'package:project1/screens/login_screen.dart';
import 'package:project1/styles/global_values.dart';
import 'package:project1/styles/styles_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: GlobalValues.flagTheme,
        builder: (context, value, _) {
          return MaterialApp(
            home: const LoginScreen(),
            routes: getRoutes(),
            theme:
                value ? StylesApp.dkTheme(context) : StylesApp.lgTheme(context),
          );
        });
  }
}
