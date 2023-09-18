import 'package:flutter/material.dart';
import 'package:project1/styles/global_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtConUser = TextEditingController();
    TextEditingController txtConPass = TextEditingController();

    final txtUser = TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      controller: txtConUser,
    );

    final txtPass = TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      controller: txtConPass,
      obscureText: true,
    );

    final imgLogo = Container(
      width: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/0f20620d-7bd4-4f88-b050-b3f080de7bf1/dfdneq0-1c662af3-5dee-4320-a8bb-129240db65bd.png/v1/fill/w_1920,h_1545/logo_of_the_legend_of_zelda__tears_of_the_kingdom_by_nintendokater_dfdneq0-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTU0NSIsInBhdGgiOiJcL2ZcLzBmMjA2MjBkLTdiZDQtNGY4OC1iMDUwLWIzZjA4MGRlN2JmMVwvZGZkbmVxMC0xYzY2MmFmMy01ZGVlLTQzMjAtYThiYi0xMjkyNDBkYjY1YmQucG5nIiwid2lkdGgiOiI8PTE5MjAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.uo4fsluwatEhDnQnpA3ndgJoiU1X5Ip_zI9sdRalHwc')),
      ),
    );

    final btnEntrar = FloatingActionButton.extended(
        icon: const Icon(Icons.login),
        label: const Text('Send'),
        onPressed: () {
          Navigator.pushNamed(context, '/dash');
        });

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: .9,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://www.xtrafondos.com/thumbs/vertical/1_2898.jpg')),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 250,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.greenAccent),
                //color: Colors.blueGrey,
                child: Column(children: [
                  txtUser,
                  const SizedBox(height: 10),
                  txtPass,
                  const SizedBox(height: 10),
                  ValueListenableBuilder(
                      valueListenable: GlobalValues.flagCheckBox,
                      builder: (context, value, _) {
                        return Row(
                          children: [
                            const Text("Recuerdame:",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )),
                            Checkbox(
                                value: GlobalValues.flagCheckBox.value,
                                onChanged: (state) async {
                                  GlobalValues.flagCheckBox.value = state!;
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  if (state) {
                                    prefs.setBool('isLogged', true);
                                  } else {
                                    prefs.setBool('isLogged', false);
                                  }
                                })
                          ],
                        );
                      })
                ]),
              ),
              Container(
                  padding: const EdgeInsets.only(bottom: 200), child: imgLogo)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: btnEntrar,
    );
  }
}
