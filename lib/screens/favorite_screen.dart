import 'package:flutter/material.dart';
import 'package:project1/database/agendadb.dart';
import 'package:project1/models/popular_model.dart';
import 'package:project1/styles/global_values.dart';
import 'package:project1/widgets/MovieWidget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Agenda agendadb = Agenda();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Movies"),
      ),
      body: ValueListenableBuilder(
          valueListenable: GlobalValues.flagFavorite,
          builder: (context, value, _) {
            return FutureBuilder(
                future: agendadb.GETALLMOVIES(),
                builder: (context, AsyncSnapshot<List<PopularModel>> snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.9),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return movieWidget(snapshot.data![index], context);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Algo salio mal :C'),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                });
          }),
    );
  }
}
