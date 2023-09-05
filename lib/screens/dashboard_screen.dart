import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenidos :D')),
      drawer: createDrawer(context),
    );
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
              accountEmail: Text('19030691@itcelaya.edu.mx')),
          ListTile(
            leading: Image.asset('assets/images/four_sword.png'),
            trailing: const Icon(Icons.chevron_right),
            title: const Text('Four Sword'),
            subtitle: const Text('So Powerful'),
            onTap: () {
              Navigator.pushNamed(context, '/item');
            },
          ),
          /* DayNightSwitcherIcon(
            isDarkModeEnabled: isDarkModeEnabled,
            onStateChanged: (isDarkModeEnabled) {
              setState(() {
                this.isDarkModeEnabled = isDarkModeEnabled;
              });
            },
          ), */
        ],
      ),
    );
  }
}
