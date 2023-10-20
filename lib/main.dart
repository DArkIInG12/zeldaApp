import 'package:flutter/material.dart';
import 'package:project1/provider/test_provider.dart';
import 'package:project1/routes.dart';
import 'package:project1/screens/dashboard_screen.dart';
import 'package:project1/screens/login_screen.dart';
import 'package:project1/styles/global_values.dart';
import 'package:project1/styles/styles_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLogged;
  bool? savedTheme;
  @override
  void initState() {
    getLogginData();
    getThemeData();
    super.initState();
  }

  Future getLogginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var logged = prefs.getBool('isLogged');
    setState(() {
      isLogged = logged;
    });
  }

  Future getThemeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('darkTheme')) {
      prefs.setBool('darkTheme', true);
    }
    var theme = prefs.getBool('darkTheme');
    setState(() {
      savedTheme = theme;
      GlobalValues.flagTheme.value = savedTheme!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: GlobalValues.flagTheme,
        builder: (context, value, _) {
          return ChangeNotifierProvider(
            create: (context) => TestProvider(),
            child: MaterialApp(
              home: isLogged == true
                  ? const DashboardScreen()
                  : const LoginScreen(),
              routes: getRoutes(),
              theme: value
                  ? StylesApp.dkTheme(context)
                  : StylesApp.lgTheme(context),
            ),
          );
        });
  }
}
