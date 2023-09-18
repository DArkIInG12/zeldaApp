import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:project1/styles/global_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    //PROBAR CAMBIO EN EL TITULO DE LA PANTALLA
    return ValueListenableBuilder(
        valueListenable: GlobalValues.flagTitle,
        builder: (context, value, _) {
          return Scaffold(
            appBar: AppBar(title: const Text('Bienvenidos :D')),
            drawer: createDrawer(context),
          );
        });
  }

  Widget createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://s.yimg.com/ny/api/res/1.2/ILrFvjJMKzTEs8gJwsO33A--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQyNw--/https://media.zenfs.com/es/levelup_525/2c550ef8c1747c9ddd444b718641caf5'),
            ),
            accountName: Text('Edgar Juarez Cordero'),
            accountEmail: Text('19030691@itcelaya.edu.mx'),
          ),
          ListTile(
            leading: Image.asset('assets/images/four_sword.png'),
            trailing: const Icon(Icons.chevron_right),
            title: const Text('Four Sword'),
            subtitle: const Text('So Powerful'),
            onTap: () {
              Navigator.pushNamed(context, '/item');
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_alt),
            trailing: const Icon(Icons.chevron_right),
            title: const Text('Task Manager'),
            onTap: () {
              Navigator.pushNamed(context, '/tasks');
            },
          ),
          const Spacer(
            flex: 1,
          ),
          DayNightSwitcher(
            isDarkModeEnabled: GlobalValues.flagTheme.value,
            onStateChanged: (isDarkModeEnabled) async {
              GlobalValues.flagTheme.value = isDarkModeEnabled;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool('darkTheme', isDarkModeEnabled);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool('isLogged', false);
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
